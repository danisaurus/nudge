require 'google/api_client'
class GmailAPI
  attr_accessor :token, :client, :gmail

  def initialize(token)
    @token = token
    @client = Google::APIClient.new(
      application_name: 'shiftdbc',
      application_version: '1.0.0')
    @client.authorization.access_token = @token.fresh_token
    @gmail = @client.discovered_api('gmail', 'v1')
  end

  def get_last_history_id(history_id)
    get_history(history_id).data.historyId
  end

  def get_message_body(message_id)
    clean_up_message_body(get_message(message_id).data.payload.parts[0].body.data)
  end

  def get_message_bodies(num_of_messages)
    ids = get_sent_message_ids(num_of_messages)
    get_sent_message_bodies(ids)
  end

  def get_draft_body(draft_id)
    clean_up_message_body(get_draft_message(draft_id).data.message.payload.parts[0].body.data)
  end

  def get_draft_bodies(num_of_messages)
    draft_ids = get_draft_message_ids(num_of_messages)
    get_draft_message_bodies(draft_ids)
  end

  def get_sent_email_within_specific_date_range(datetime)
    @client.execute(
      api_method: @gmail.users.messages.list,
      parameters: {
        userId: "me",
        q: "in:sent newer_than:1d"},
        headers: {'Content-Type' => 'application/json'}
      )
  end


  def get_emails_for_today(start_history_id)
    daily_emails = []
    daily_email_ids = get_sent_history_ids(start_history_id)
    daily_email_ids.each {|email_id| daily_emails << get_message_body(email_id)}
    daily_emails
  end

  def get_message_date(message_id)
    get_message(message_id).data.payload.headers[2].value
  end

  # private

  def clean_up_message_body(body)
    body.gsub(/(\r\n)/, " ")
  end

  def get_start_history_id
    first_message_id = get_message_list.data.messages[0].id
    message = get_message(first_message_id)
    message.data.history_id
  end

  def get_history(history_id)
    @client.execute(
      api_method: @gmail.users.history.list,
      parameters: {
        userId: "me",
        startHistoryId: history_id},
        headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_message_list
    @client.execute(
      api_method: @gmail.users.messages.list,
      parameters: {
        maxResults: 10,
        userId: "me"},
      headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_message(message_id)
    @client.execute(
      api_method: @gmail.users.messages.get,
      parameters: {
        userId: "me",
        id: message_id},
      headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_sent_message_list(max_results)
    @client.execute(
      api_method: @gmail.users.messages.list,
      parameters: {
        maxResults: max_results,
        userId: "me",
        labelIds: "SENT"},
      headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_sent_message_ids(max_results)
    sent_message_ids = []
    get_sent_message_list(max_results).data.messages.each {|message| sent_message_ids << message.id}
    sent_message_ids
  end

  def get_sent_message_bodies(sent_message_ids)
    message_body_array = []
    sent_message_ids.each {|message_id| message_body_array << get_message_body(message_id)}
    message_body_array
  end

  def get_draft_message(draft_id)
    @client.execute(
      api_method: @gmail.users.drafts.get,
      parameters: {
        userId: "me",
        id: draft_id},
      headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_draft_message_list(max_results)
    @client.execute(
      api_method: @gmail.users.drafts.list,
      parameters: {
        maxResults: max_results,
        userId: "me"},
        headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_draft_message_ids(max_results)
    draft_message_ids = []
    get_draft_message_list(max_results).data.drafts.each {|draft| draft_message_ids << draft.id}
    draft_message_ids
  end

  def get_draft_message_bodies(draft_message_ids)
    draft_body_array = []
    draft_message_ids.each {|draft_id| draft_body_array << get_draft_body(draft_id)}
    draft_body_array
  end

  def get_sent_history_list(start_history_id)
    @client.execute(
      api_method: @gmail.users.history.list,
      parameters: {
        userId: "me",
        labelId: "SENT",
        startHistoryId: start_history_id},
        headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_sent_history_ids(start_history_id)
    array = []
    get_sent_history_list(start_history_id).data.history.each do |stuff|
      unless stuff.messages.empty?
        array << stuff.messages[0]['id']
      end
    end
    array.uniq
  end

end
