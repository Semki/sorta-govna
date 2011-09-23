class AddDescriptionColumnToShit < ActiveRecord::Migration
  def change
    add_column :shits, :description, :string
  end
end
