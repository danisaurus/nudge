require 'rails_helper'

RSpec.describe Keyword, :type => :model do

  describe "associations" do
    it { should belong_to(:gmail) }
  end

end
