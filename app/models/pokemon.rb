class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_one_attached :image
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
