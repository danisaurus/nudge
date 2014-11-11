require 'twitter'
class Tweet < ActiveRecord::Base
  belongs_to :daily_report

end
