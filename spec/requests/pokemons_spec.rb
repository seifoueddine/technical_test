# spec/requests/pokemons_spec.rb
require 'rails_helper'

RSpec.describe "Pokemons", type: :request do
  let(:user) { create(:user) }
  let(:pokemon) { create(:pokemon, user: user) }

  before do
    sign_in user
  end

  describe "GET /pokemons" do
    it "returns a list of all pokemons" do
      pokemon
      get pokemons_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "GET /pokemons/:id" do
    it "returns a specific pokemon" do
      get pokemon_path(pokemon)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['name']).to eq(pokemon.name)
    end
  end

  describe "GET /pokemons/:id/checkout" do
    it "returns a checkout message and the pokemon" do
      get checkout_pokemon_path(pokemon)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['message']).to eq("Proceed to buy Pokémon")
      expect(json['pokemon']['id']).to eq(pokemon.id)
    end
  end

  describe "POST /pokemons/:id/buy" do
    it "allows a user to buy a pokemon if they have enough balance" do
      user.update(balance: pokemon.price + 10)
      post buy_pokemon_path(pokemon)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['success']).to be_truthy
      expect(json['message']).to eq("Pokémon bought successfully")
    end

    it "prevents a user from buying a pokemon if they don't have enough balance" do
      user.update(balance: 0.0)
      post buy_pokemon_path(pokemon)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['success']).to be_falsey
      expect(json['message']).to eq("Insufficient balance")
    end
  end

  describe "POST /pokemons/:id/sell" do
    it "allows a user to sell a pokemon if they own it" do
      pokemon.update(user: user)
      post sell_pokemon_path(pokemon)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['success']).to be_truthy
      expect(json['message']).to eq("Pokémon sold successfully")
    end

    it "prevents a user from selling a pokemon if they don't own it" do
      another_user = create(:user)
      pokemon.update(user: another_user)
      post sell_pokemon_path(pokemon)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['success']).to be_falsey
      expect(json['message']).to eq("You do not own this Pokémon")
    end
  end
end
