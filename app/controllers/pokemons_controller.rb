class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :checkout, :buy, :sell]

  # GET /pokemon
  def index
    pokemons = Pokemon.all
    render json: pokemons
  end

  # GET /pokemon/:id
  def show
    render json: @pokemon.to_json(include: :user)
  end

  # GET /pokemon/:id/checkout
  def checkout
    render json: { message: "Proceed to buy Pokémon", pokemon: @pokemon }
  end

  # POST /pokemon/:id/buy
  def buy
    if current_user.balance >= @pokemon.price
      ActiveRecord::Base.transaction do
        current_user.update!(balance: current_user.balance - @pokemon.price)
        @pokemon.update!(user: current_user)
        Transaction.create!(action: :buy, user: current_user, pokemon: @pokemon)
      end
      render json: { success: true, message: 'Pokémon bought successfully' }
    else
      render json: { success: false, message: 'Insufficient balance' }
    end
  end

  # POST /pokemon/:id/sell
  def sell
    if @pokemon.user == current_user
      ActiveRecord::Base.transaction do
        current_user.update!(balance: current_user.balance + @pokemon.price)
        @pokemon.update!(user: nil)
        Transaction.create!(action: :sell, user: current_user, pokemon: @pokemon)
      end
      render json: { success: true, message: 'Pokémon sold successfully' }
    else
      render json: { success: false, message: 'You do not own this Pokémon' }
    end
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
