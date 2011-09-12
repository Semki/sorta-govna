class CreateShits < ActiveRecord::Migration
  def self.up
    create_table :shits do |t|
      t.string :name
      t.integer :total
      t.timestamps
    end
  end

  def self.down
    drop_table :shits
  end
end
