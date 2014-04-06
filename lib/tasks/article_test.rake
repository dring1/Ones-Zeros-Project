namespace :gen_test do

    topics = ["Java", "Scala", "Ruby", "Ruby-on-Rails", "Python", "Unix",
    "Computer Science", "Graphs", "Javascript", "nodejs", "Angularjs", "Data Structures", "Django", "Education", "Map Reduce"]

    task :gen_articles => :environment  do
        Article.destroy_all
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

    task :gen_seq_date_articles => :environment do
      Article.destroy_all
      date = Date.new(2013,1,1)
      (1..365).each do |i|
        art = Article.create(name: "Article-#{i}")
        art.up_vote = 1500
        art.down_vote = 750
        art.topic_list.add("Ruby", "Ruby-on-Rails", "Python", "Unix",
        "Computer Science", "Graphs", "Javascript")
        art.save
        art.created_at = date
        art.save
        date = date.next
        puts i
      end
    end

    task :year_rank_compute => :environment  do
      file = File.open("output-yearly-final.txt", "a")

      Article.all.each do |article|
        file << "#{article.name} \t #{article.created_at.to_date} \t #{Article.rank(article, article.topic_list, 0)} \n"
      end
      file.close
    end

end
