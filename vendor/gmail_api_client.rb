require 'google/api_client'
class GmailAPI

  def initialize(token)
    @token = token
    @client = Google::APIClient.new(
      application_name: 'Gmail Alerts',
      application_version: '1.0.0')
    @gmail = @client.discovered_api('gmail', 'v1')
    @client.authorization.access_token = @token.fresh_token #"ya29.uQBXW-pBGTN-INjHZtpQI3pez3L2T4weQUxr2FaYWz5jPgyL7OS3E5Tadmn7BrTcbt5o8mCgzya06g"
  end

  def get_message_list
    result = @client.execute(
      api_method: @gmail.users.messages.list,
      parameters: {
        maxResults: 10,
        userId: "me"},
      headers: {'Content-Type' => 'application/json'}
      )
    return result
  end

  def get_message(message_id)
    message = @client.execute(
      api_method: @gmail.users.messages.get,
      parameters: {
        userId: "me",
        id: message_id},
      headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_start_history_id
    message_id = JSON.parse(get_message_list.body)['messages'][0]['id']
    message = get_message(message_id)
    JSON.parse(message.body)['historyId'].to_i
  end

  def get_history
    history = @client.execute(
      api_method: @gmail.users.history.list,
      parameters: {
        userId: "me",
        startHistoryId: get_start_history_id},
        headers: {'Content-Type' => 'application/json'}
      )
  end

  def get_last_history_id
    JSON.parse(get_history.body)['historyId']
  end


end
