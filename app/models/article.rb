class Article < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :topics
		
	has_many :voted_on_relationships
	has_many :users, through: :voted_on_relationships
end
