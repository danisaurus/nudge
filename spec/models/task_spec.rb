require 'rails_helper'

RSpec.describe Task, :type => :model do

  describe "associations" do
    it { should have_many(:triggers) }
  end

end
