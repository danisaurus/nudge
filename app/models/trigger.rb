class Trigger < ActiveRecord::Base

  belongs_to :task
  belongs_to :user

end
