class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 150 }
  validates :price, presence: true, numericality: {greater_than: 0.01}
  validates :category, presence: true
end
