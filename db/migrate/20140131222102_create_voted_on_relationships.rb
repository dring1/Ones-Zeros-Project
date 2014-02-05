class CreateVotedOnRelationships < ActiveRecord::Migration
  def change
    create_table :voted_on_relationships do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end

  add_index :voted_on_relationships, :user_id
  add_index :voted_on_relationships, :article_id
  add_index :voted_on_relationships, [:user_id, :article_id], unique: true	  
end
