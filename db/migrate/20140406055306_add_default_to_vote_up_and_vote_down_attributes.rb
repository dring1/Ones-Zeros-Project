class AddDefaultToVoteUpAndVoteDownAttributes < ActiveRecord::Migration
  def change
    change_column_default :articles, :up_vote,   0
    change_column_default :articles, :down_vote,   0
  end
end
