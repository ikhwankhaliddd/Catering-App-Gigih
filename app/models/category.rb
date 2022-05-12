class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
  has_many :food_categories
  has_many :foods, through: :food_categories
end
