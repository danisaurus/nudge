class DailyReport < ActiveRecord::Base
  belongs_to :user
  has_many :tweets
  has_many :gmails
  has_many :check_ins

  def data_average(data_type)
    data = self.send(data_type)
    unless data.empty?
      data.map{|type| type.quantitative}.inject(:+) / data.count.to_f
    end
  end

end
