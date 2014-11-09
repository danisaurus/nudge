module Magic

  def fetch_message_ids(gmail, token)
    url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages?access_token=#{@access_token}"
    data = Net::HTTP.get_response(URI(url)).body
  end

  def scrub_ids(data)
    ids = []
    raw = JSON.parse(data)
    raw['messages'].each { |hashed_ids| ids << hashed_ids['id'] }
    ids
  end

  def fetch_email(email_id)
    email_url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages/#{email_id}?access_token=#{@access_token}"
    email_data = Net::HTTP.get_response(URI(email_url)).body
    return JSON.parse(email_data)
  end

  def get_email_messages(ids)
    emails_array = []
    ids.each {|email_id| emails_array << fetch_email(email_id)}
    emails_array
  end
end
