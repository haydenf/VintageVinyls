class Vinyl < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  
  has_many_attached :pictures
end
