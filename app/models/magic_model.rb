class MagicModel
  attr_reader :token, :url, :data, :ids
  def initialize(gmail, token)
    @gmail = gmail
    @token = token
    @access_token = token.access_token
    @url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages?access_token=#{@access_token}"
    fetch!
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

  def fetch_email(email_id)
    email_url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages/#{email_id}?access_token=#{@access_token}"
    @email_data = Net::HTTP.get_response(URI(email_url)).body
  end

  def retrieve_email_messages
    fetch_email(ids[0])
    # ids.each {|email_id| fetch_email(email_id)}
  end

end

# https://www.googleapis.com/gmail/v1/users/m.j.mey3rs@gmail.com/messages?access_token=ya29.twDOtM3zReWD5dbnembU3GMgyP5JUzFSJU85BH9Ge3l-jZT6-Q-Mc2XuhLOulipg7qLFP0WhTdxrzQ
# data.split(',').reject! { |x| x unless x =~ /id/ }.map! {|x| x.delete "\n" }.map! {|x| x.strip }.map! {|x| x.delete '"' }.compact!.map! { |string| string.slice((string =~ /id/)+4..-1) }
