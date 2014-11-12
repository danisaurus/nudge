class Trigger < ActiveRecord::Base

  belongs_to :task
  belongs_to :user
  validates :message_text, presence: true
end
