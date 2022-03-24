class Listing < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  
  belongs_to :user
  has_one_attached :picture
end
