require 'twitter'
class Tweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :daily_report

end
