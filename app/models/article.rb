class Article < ActiveRecord::Base
    before_save
    acts_as_taggable
    acts_as_taggable_on :topics
    ActsAsTaggableOn.force_lowercase = true

    has_many :voted_on_relationships
    has_many :users, through: :voted_on_relationships

    validates :name, presence: true, length: {maximum: 50}
    EPOCH = Time.new(1970,1,1)

    def vote(art_id)
        voted_on_relationships.create(user_id: self.id, article_id: article_id)
    end

    #overall recommendations
    def self.recommend(interests)
        t1 = Time.new
        list = {}
        if interests.empty?
          default_list = {}
          Article.limit(10).each do |article|
            default_list[article.id] = self.rank(article, interests,false).ceil
          end
          recommended = default_list.sort_by {|k,v| v}
          Hash[recommended.to_a.reverse]
        end

            #BASE CASE FOR TOPICS SIZE is not array?
            #Using probabilistic model - undeterministed
        if interests.kind_of?(Array)
            rand_index = interests.size
            #main_topic = interests[rand(rand_index)]
            main_topic = interests.sample(Math.sqrt(interests.size).ceil)
            main_list = Article.tagged_with(main_topic)

            t2 = Time.new
            #temp= main_list.sample(Math.sqrt(main_list.size).ceil)
            #reduce number of elements in main list to ceil,(root n )
            t3 = Time.new
            main_list.sample(Math.sqrt(main_list.size).ceil).each do |article|
                list[article.id] =  self.rank(article, interests,true).ceil
            end
            t4 = Time.new
            #find percentages - list by percentages
            list.sort_by {|k,v| v}
            t5 = Time.new
        end

        #returns recommended in descending order
        recommended = list.sort_by {|k,v| v}.last(10)

        #output = {}
        # recommended.each { |k,v| output[Article.find_by(id: k)] = v}

        t6 = Time.new
        # file = File.open("output-25k.txt", "a")
        # file << "main_list size: #{main_list.size} main_topic size:
        #   #{main_topic.size}\n"
        # file << "DIFF2 #{t2 - t1} \n"
        # file << "DIFF3 #{t3 - t1} \n"
        # file << "DIFF4 #{t4 - t1} \n"
        # file << "DIFF5 #{t5 - t1} \n"
        # file << "DIFF6 #{t6 - t1}\n"
        # file.close

        Hash[recommended.to_a.reverse]
    end

    def self.specific_recommend(interest)
        main_list = Article.tagged_with(interest)
        list = {}
        main_list.each do |article|
            list[article.id] =  self.rank(article, interest, false).ceil
        end
        recommended = list.sort_by {|k,v| v}.last(10)
        output = {}
        recommended.each { |k,v| output[Article.find_by(id: k)] = v}
        Hash[output.to_a.reverse]
    end


    #REDDIT'S 2005 HOT ALGORITHM WITH CUSTOM ACCURACY
    #http://amix.dk/blog/post/19588
    # very expensive but accurate results
    def self.rank(article, interests, specific)
        t1 = Time.new
        popularity = article.up_vote - article.down_vote
        #compute percent value of intersection of topics and user interests
        accuracy = if specific

                        (article.topic_list & interests).size.to_f / interests.size.to_f
                    else
                        1
                    end
        t2 = Time.new
        seconds  = epoch_seconds(article.created_at) - 1134028003
        order = Math.log([popularity.abs,1].max ,10)
        t3 = Time.new
        sign  = if popularity > 0
            1
        elsif  popularity < 0
            -1
        else
            0
        end
        #change order + .. to rever to deliverable 1 rank
        temp = ((order * sign * seconds / 45000) * accuracy).round(7)
        t4 = Time.new
        temp
    end


    def self.epoch_seconds(date)
        diff = (date - EPOCH).to_i
    end



end
