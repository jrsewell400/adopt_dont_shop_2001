class Pet < ApplicationRecord 
  validates_presence_of :name, :age, :sex, :status, :image

  belongs_to :shelter
end 