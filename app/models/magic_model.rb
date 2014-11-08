class MagicModel
  attr_reader :token, :url, :data, :ids, :labels
  attr_accessor :emails
  def initialize(gmail, token)
    @labels = []
    @gmail = gmail
    @token = token
    @access_token = token.access_token
    @url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages?access_token=#{@access_token}"
    fetch!
    scrub_ids
    @emails = get_email_messages
    get_labels(@emails)
  end

  def fetch!
    @data = Net::HTTP.get_response(URI(url)).body
  end

  def scrub_ids
    @ids = []
    raw = JSON.parse(data)
    raw['messages'].each { |hashed_ids| ids << hashed_ids['id'] }
    return ids
  end

  def get_email_date(email)
  end

  def get_labels(emails)
    emails.each {|email| labels << email['labelsId']}
  end

  def retrieve_sent_emails
    #use the labels array to find the indices of the arrays which contain 'SENT'
    #iterate throug the emails_array and find the emails which match the indices
  end

  def fetch_email(email_id)
    email_url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages/#{email_id}?access_token=#{@access_token}"
    email_data = Net::HTTP.get_response(URI(email_url)).body
    return JSON.parse(email_data)
  end

  def get_email_messages
    emails_array = []
    ids.each {|email_id| emails_array << fetch_email(email_id)}
    return emails_array
  end

end

# https://www.googleapis.com/gmail/v1/users/m.j.mey3rs@gmail.com/messages?access_token=ya29.twDOtM3zReWD5dbnembU3GMgyP5JUzFSJU85BH9Ge3l-jZT6-Q-Mc2XuhLOulipg7qLFP0WhTdxrzQ
# data.split(',').reject! { |x| x unless x =~ /id/ }.map! {|x| x.delete "\n" }.map! {|x| x.strip }.map! {|x| x.delete '"' }.compact!.map! { |string| string.slice((string =~ /id/)+4..-1) }
