class Article < ActiveRecord::Base

	has_many :voted_on_relationships
	has_many :users, through: :voted_on_relationships
end
