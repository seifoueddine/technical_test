class RemoveImagePathFromPokemons < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :image_path, :string
  end
end
