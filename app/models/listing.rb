class Listing < ApplicationRecord

  # these are validations to make sure that these are all entered prior to creating a listing
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  
  # each listing MUST have a user that is creating it
  belongs_to :user

  # a listing will have a picture in it too
  has_one_attached :picture
end
