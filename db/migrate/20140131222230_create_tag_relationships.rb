class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
  end

  add_index :tag_relationships, :user_id
  add_index :tag_relationships, :tag_id
  add_index :tag_relationships, [:user_id, :tag_id], unique: true
end
