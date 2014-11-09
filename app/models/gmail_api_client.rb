require 'google/api_client'
class GmailAPI

  #setting up a new client with their
  def setup
    @client = Google::APIClient.new(
      application_name: 'Gmail Alerts',
      application_version: '1.0.0')
    @gmail = @client.discovered_api('gmail', 'v1')
    @client.authorization.access_token =
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

  # def show_message(client, gmail, emails)

  # end

end
