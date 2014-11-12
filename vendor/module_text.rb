module Texter

  # Make sure those environment variables are set before running
  def text(message, phone_number)
    client = Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"])
    client.account.messages.create({
      from: ENV['TWILIO_NUM'],
      to: phone_number,
      body: message
      })
  end

end
