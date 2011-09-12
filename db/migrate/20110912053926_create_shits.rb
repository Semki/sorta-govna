class CreateShits < ActiveRecord::Migration
  def change
    create_table(:shits) do |t|
      t.string :name
      t.integer :total
      t.timestamps
    end
  end
end
