class Student < ApplicationRecord
  extend FriendlyId
  friendly_id :lrn, use: [:slugged , :finders]
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :gender, presence: true
  validates :lrn , presence: true, uniqueness: true
end
