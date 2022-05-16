class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :food_categories
  has_many :foods, through: :food_categories
end
