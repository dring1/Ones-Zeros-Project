class AddTopicsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :topics, :string
  end
end
