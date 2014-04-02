namespace :gen_test do

    task :gen_articles => :environment  do
        Article.destroy_all
        topics = ["Java", "Scala", "Ruby", "Ruby-on-Rails", "Python", "Unix",
         "Computer Science", "Graphs", "Javascript", "nodejs", "Angularjs", "Data Structures", "Django", "Education", "Map Reduce"]

        size   = topics.size

        (1..25000).each do |i|
            a = Article.create(name: "Article-#{i}")
            topics.each do |t|
                coin_flip = rand(0..1)
                a.topic_list.add(t) if (coin_flip == 1)
            end
            a.up_vote  = rand(1..25000)
            a.down_vote = rand(-500..-1)
            a.save
            a.created_at = Date.new(rand(2000..2013),rand(1..12),rand(1..28))
            a.save
        end
        #create user


    end
end
