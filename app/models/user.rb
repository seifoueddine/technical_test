# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pokemons
  has_many :transactions

  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  

end