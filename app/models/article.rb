class Article < ActiveRecord::Base
    before_save 
    acts_as_taggable
    acts_as_taggable_on :topics
    ActsAsTaggableOn.force_lowercase = true

    has_many :voted_on_relationships
    has_many :users, through: :voted_on_relationships

    EPOCH = Time.new(1970,1,1)

    def self.recommend(interests)
        return self.limit(10) if interests.empty?
        #BASE CASE FOR TOPICS SIZE is not array?
        #Using probabilistic model - undeterministed
        if interests.kind_of?(Array)
            rand_index = interests.size
            main_topic = interests[rand(rand_index)]
            main_list = Article.tagged_with(main_topic)
            main_list.each do |article|
                #include exclude topics?
            end
            #find percentages - list by percentages 
        end
    end


    #REDDIT'S 2005 HOT ALGORITHM WITH CUSTOM ACCURACY
    #http://amix.dk/blog/post/19588

    def self.rank(article, interests)
        popularity = article.up_vote - article.down_vote
        p "VOTES: #{popularity}  "
        #compute percent value of intersection of topics and user interests
        accuracy   = (article.topic_list & interests).size.to_f / interests.size.to_f
        seconds  = epoch_seconds(article.created_at) - 1134028003
        order = Math.log([popularity.abs,1].max ,10)
        sign  = if popularity > 0
                    1
                elsif  popularity < 0
                    -1
                else
                    0
                end
        ((order + sign * seconds / 45000) * accuracy).round(7)
    end

    def self.epoch_seconds(date)
        diff = (date - EPOCH).to_i
    end




end
