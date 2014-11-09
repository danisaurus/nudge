require 'google/api_client'
class GmailAPI

  #setting up a new client with their
  def setup(token)
    @client = Google::APIClient.new(
      application_name: 'Gmail Alerts',
      application_version: '1.0.0')
    @gmail = @client.discovered_api('gmail', 'v1')
    if token.expired?
      token.refresh!
    end
    @client.authorization.access_token = token.access_token #"ya29.uQBXW-pBGTN-INjHZtpQI3pez3L2T4weQUxr2FaYWz5jPgyL7OS3E5Tadmn7BrTcbt5o8mCgzya06g"
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

  # def show_message(client, gmail, emails)

  # end

end
