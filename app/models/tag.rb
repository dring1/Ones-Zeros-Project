class Tag < ActiveRecord::Base

	has_many :tag_relationships, dependent: :destroy
	has_many :users, through: :tag_relationships
end
