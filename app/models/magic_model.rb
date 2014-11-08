class MagicModel
  attr_reader :token, :url, :data, :ids, :labels, :labels_array, :emails_array, :sent_email_indices, :sent_emails
  attr_accessor :emails
  def initialize(gmail, token)
    @gmail = gmail
    @token = token
    @access_token = token.access_token
    @url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages?access_token=#{@access_token}"
    fetch!
    scrub_ids
    get_email_messages
    @labels = get_labels
  end

  def fetch!
    @data = Net::HTTP.get_response(URI(url)).body
  end

  def scrub_ids
    @ids = []
    raw = JSON.parse(data)
    raw['messages'].each { |hashed_ids| @ids << hashed_ids['id'] }
    @ids
  end

  # def get_most_recent_sent_email_date
  #   sent_emails = []
  #   @emails_array.each_with_index {|email, index| sent_emails << email if sent_email_indices.include?(index) }
  #   sent_emails[0]
  # end

  def get_most_recent_sent
    # @emails_array.
  end

  def get_labels
    @labels_array = []
    @emails_array.each {|email| @labels_array << email['labelIds']}
    @labels_array
  end

  def get_sent_email_indices
    #use the labels array to find the indices of the arrays which contain 'SENT'
    @sent_email_indices = []
    @labels.each_with_index {|array, index| sent_email_indices << index if !array.nil? && array.include?("SENT")}
  end

  def retrieve_sent_emails
    #iterate through the emails_array and find the emails which match the sent_email_indices
    sent_emails = []
    @sent_email_indices.each do |index|
      sent_emails << @emails_array[index]
    end
  end

  def fetch_email(email_id)
    email_url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages/#{email_id}?access_token=#{@access_token}"
    email_data = Net::HTTP.get_response(URI(email_url)).body
    return JSON.parse(email_data)
  end

  def get_email_messages
    @emails_array = []
    ids.each {|email_id| emails_array << fetch_email(email_id)}
    @emails_array
  end

end

# https://www.googleapis.com/gmail/v1/users/m.j.mey3rs@gmail.com/messages?access_token=ya29.twDOtM3zReWD5dbnembU3GMgyP5JUzFSJU85BH9Ge3l-jZT6-Q-Mc2XuhLOulipg7qLFP0WhTdxrzQ
# data.split(',').reject! { |x| x unless x =~ /id/ }.map! {|x| x.delete "\n" }.map! {|x| x.strip }.map! {|x| x.delete '"' }.compact!.map! { |string| string.slice((string =~ /id/)+4..-1) }
