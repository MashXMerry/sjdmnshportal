class Student < ApplicationRecord
  validates :lrn , presence: true , uniqueness: true
  has_many :grades , dependent: :destroy
end
