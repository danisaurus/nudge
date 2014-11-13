class Trigger < ActiveRecord::Base

  belongs_to :task
  belongs_to :user
  validates_presence_of :message_text
end
