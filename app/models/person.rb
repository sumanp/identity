class Person < ApplicationRecord
  has_many :details
  validates :name, presence: true
end