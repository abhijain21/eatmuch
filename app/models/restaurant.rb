class Restaurant < ActiveRecord::Base
  attr_accessible :address, :name, :rating
  has_many :reviews

  validates_presence_of :name

  def avg_rating
    reviews.select("AVG(rating) AS avg_rating").first.avg_rating.try(:round) || 0
  end


end
