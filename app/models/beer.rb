class Beer < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true
  has_many :comments
  has_many :commentors, through: :comments, source: 'user'

  validates :name, :style, :region, :abv, presence: true 

end
