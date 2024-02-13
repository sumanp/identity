class Person < ApplicationRecord
  has_many :details
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
end