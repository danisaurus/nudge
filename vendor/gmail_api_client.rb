require 'google/api_client'
class GmailAPI
  attr_accessor :token, :client, :gmail

  def initialize(token)
    @token = token
    @client = Google::APIClient.new(
      application_name: 'Gmail Alerts',
      application_version: '1.0.0')
    @client.authorization.access_token = @token.fresh_token
    @gmail = @client.discovered_api('gmail', 'v1')
  end

  def get_last_history_id
    get_history.data.historyId
  end

  def get_message_body(message_id)
    clean_up_message_body(get_message(message_id).data.payload.parts[0].body.data)
  end

  private

  def clean_up_message_body(body)
    body.gsub(/(\r\n)/, " ")
  end

  def get_start_history_id
    first_message_id = get_message_list.data.messages[0].id
    message = get_message(first_message_id)
    message.data.history_id
  end

  def get_history
    @client.execute(
      api_method: @gmail.users.history.list,
      parameters: {
        userId: "me",
        startHistoryId: get_start_history_id},
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

  def get_history
    @client.execute(
      api_method: @gmail.users.history.list,
      parameters: {
        userId: "me",
        startHistoryId: get_start_history_id},
        headers: {'Content-Type' => 'application/json'}
      )
  end

end
