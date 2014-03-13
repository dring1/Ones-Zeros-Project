class AddRecommendedListToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recommended_list, :text
  end
end
