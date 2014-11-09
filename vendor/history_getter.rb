module Magic

  def fetch_message_ids(gmail, token)
    url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages?access_token=#{token}"
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


class HistoryGetter
  include Magic

  #initialize HistoryGetter with gmail and token
  #get start history id
  #get the history log of user based on their start history id, email, and access token

  attr_reader :gmail, :url, :access_token, :start_history_id

  def initialize(gmail, token)
    @gmail = gmail
    @token = token
    @access_token = token.access_token
    @start_history_id = get_history_id
    @url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/history?startHistoryId=#{@start_history_id}&access_token=#{@access_token}"
  end

  def get_history_id
    # get the first email in MagicModel's emails_array
    data = fetch_message_ids(gmail, access_token)
    ids = scrub_ids(data)
    emails = get_email_messages(ids)
    emails[0]['historyId']
  end

  def fetch_history
    Net::HTTP.get_response(URI(url)).body
  end

  def get_last_history_id
    raw = JSON.parse(fetch_history)
    raw['history'].last['id']
  end
end
