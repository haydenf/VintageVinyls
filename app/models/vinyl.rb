class Vinyl < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer, optional: true
  
  has_many_attached :pictures
end
