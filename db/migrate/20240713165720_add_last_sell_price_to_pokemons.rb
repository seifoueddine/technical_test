class AddLastSellPriceToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :last_sell_price, :decimal
  end
end
