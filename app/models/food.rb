class Food < ApplicationRecord
  belongs_to :user
  has_many :food_categories
  has_many :categories, through: :food_categories
  validates :name, presence: true, length: { maximum: 150 }
  validates :price, presence: true, numericality: {greater_than: 0.01}
end
