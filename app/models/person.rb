class Person < ApplicationRecord
  has_many :details, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
end