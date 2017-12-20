class Student < ApplicationRecord
  extend FriendlyId
  friendly_id :lrn, use: [:slugged , :finders]
  validates :lrn , presence: true , uniqueness: true
  # has_many :grades , dependent: :destroy
end
