# spec/requests/me_spec.rb
require 'rails_helper'

RSpec.describe "Me", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /me" do
    it "returns the current user's information" do
      get me_path
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['email']).to eq(user.email)
    end
  end

  describe "GET /me/add" do
    it "returns a message to add money to the wallet" do
      get add_me_path
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['message']).to eq("Add money to your wallet")
    end
  end

  describe "PATCH /me/add" do
    it "allows a user to add money to their wallet" do
      patch add_me_path, params: { amount: 50.0 }
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['success']).to be_truthy
      expect(json['message']).to eq("Balance updated successfully")
      expect(json['balance']).to eq("150.0")
    end

    it "prevents a user from adding an invalid amount" do
      patch add_me_path, params: { amount: -10.0 }
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['success']).to be_falsey
      expect(json['message']).to eq("Invalid amount")
    end
  end

  describe "GET /me/transactions" do
    it "returns the current user's transactions" do
      transaction = create(:transaction, user: user)
      get transactions_me_path
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json.size).to eq(1)
    end
  end
end
