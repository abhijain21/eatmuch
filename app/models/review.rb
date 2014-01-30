class Review < ActiveRecord::Base
  attr_accessible :rating, :user_id, :comment
  belongs_to :restaurant
  belongs_to :user
  validates_presence_of :user_id, :restaurant_id
  validates :user_id, :uniqueness => {:scope => :restaurant_id}
  validates :rating, :numericality => {:only_integer => true, :greater_than => 0, :less_than_or_equal_to => 5}
end
