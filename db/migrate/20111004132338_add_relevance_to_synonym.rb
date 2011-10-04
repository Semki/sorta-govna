class AddRelevanceToSynonym < ActiveRecord::Migration
  def change
    add_column :synonyms, :relevance, :integer
  end
end
