class Trigger < ActiveRecord::Base

  belongs_to :task




def hello_world
  p "hello world"
end

end
