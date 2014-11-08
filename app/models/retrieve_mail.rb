require 'magic_model'

class RetrieveMail

  def initialize(gmail, token, mail_id)
    @gmail = gmail
    @token = token
    @access_token = token.access_token
    @url = "https://www.googleapis.com/gmail/v1/users/#{@gmail}/messages/#{@mail_id}"
  end



end
