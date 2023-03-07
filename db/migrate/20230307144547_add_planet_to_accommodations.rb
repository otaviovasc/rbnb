class AddPlanetToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :planet, :string
  end
end
