class Article < ActiveRecord::Base
	before_save 
	acts_as_taggable
	acts_as_taggable_on :topics
	ActsAsTaggableOn.force_lowercase = true


		
	has_many :voted_on_relationships
	has_many :users, through: :voted_on_relationships


	def self.recommend(topics)
		return self.limit(10) if topics.empty?
		#BASE CASE FOR TOPICS SIZE is not array?
		#Using probabilistic model - undeterministed
		if topics.kind_of?(Array)
			rand_index = topics.size
			main_topic = topics[rand(rand_index)]
			main_list = Article.tagged_with(main_topic)
			main_list.each do |article|
				#include exclude topics?
			end
			#find percentages - list by percentages 
		end
	end

	def self.rank(article, topics)
		popularity = up_vote - downvote
		accuracy   = article.
		existence  = Time.now - article.created_at 

	end
end
