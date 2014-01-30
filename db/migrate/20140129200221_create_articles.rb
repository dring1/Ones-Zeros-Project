class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :url
      t.integer :up_vote
      t.integer :down_vote

      t.timestamps
    end
  end
end
