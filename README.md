# Ones and Zeros Project README
###This project is for Carleton University's COMP4905 Honours Project Course by Devon Ring

#####Documentation for the project is available at:

##To get up and running

1. Have Rails installed
2. git clone https://github.com/dring1/Ones-Zeros-Project.git
3. cd into Ones-Zeros-Project/
4. bundle install
5. rails s to launch server
6. Visit localhost:3000


### Generate Dummy Data
Some tasks have been created to generate dummy data
1. rake gen_test:gen_articles_25k #large set with high number of tags
2. rake gen_test:gen_articles_5k #smaller set with lower number of tags
3. rake gen_test:gen_seq_date_articles #creates articles with dates b/w Jan-Dev 2013
