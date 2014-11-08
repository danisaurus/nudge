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
    data = Magic.fetch_message_ids(@gmail, @access_token)
    ids = Magic.scrub_ids(data)
    emails = Magic.get_email_messages(ids)

    emails.first
    # get the first email in MagicModel's emails_array
  end

  def fetch_history
    @data = Net::HTTP.get_response(URI(url)).body
  end

  def get_last_history_id
    raw = JSON.parse(@data)
    raw['history'].last['id']
  end
end
