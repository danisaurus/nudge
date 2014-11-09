require 'google/api_client'
class GmailAPI

  #setting up a new client with their
  def setup
    google_api_client = Google::APICLient.new(
      application_name: 'Gmail Alerts',
      application_version: '1.0.0')
    gmail = google_api_client.discovered_api('gmail', 'v1')
    return google_api_client, gmail
  end

  def get_message_list(client, gmail)
    result = client.execute(
      api_method: gmail.users.messages.list,
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
