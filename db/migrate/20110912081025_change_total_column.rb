class ChangeTotalColumn < ActiveRecord::Migration
  def self.up
    change_column_default :shits, :total, 0
  end

  def self.down
    change_column_default :shits, :total, nil
  end
end
