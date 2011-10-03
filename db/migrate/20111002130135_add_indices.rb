class AddIndices < ActiveRecord::Migration
  def up
    add_index :shits, :name
    add_index :shits, :total

    add_index :synonyms, :name
    add_index :synonyms, :shit_id

    add_index :timelines, :date
    add_index :timelines, :shit_id
    add_index :timelines, :total
  end

  def down
    remove_index :shits, :name
    remove_index :shits, :total

    remove_index :synonyms, :name
    remove_index :synonyms, :shit_id

    remove_index :timelines, :date
    remove_index :timelines, :shit_id
    remove_index :timelines, :total
  end
end
