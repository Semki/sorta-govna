class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.date :date
	  t.integer :shit_id
      t.integer :total
      t.timestamps
    end
  end
end
