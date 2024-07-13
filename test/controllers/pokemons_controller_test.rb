require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemons_index_url
    assert_response :success
  end

  test "should get show" do
    get pokemons_show_url
    assert_response :success
  end

  test "should get checkout" do
    get pokemons_checkout_url
    assert_response :success
  end

  test "should get buy" do
    get pokemons_buy_url
    assert_response :success
  end

  test "should get sell" do
    get pokemons_sell_url
    assert_response :success
  end
end
