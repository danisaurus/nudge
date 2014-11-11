class Gmail < ActiveRecord::Base
  belongs_to :daily_report
  has_many :keywords
end
