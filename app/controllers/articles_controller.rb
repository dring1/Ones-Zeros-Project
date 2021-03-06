class ArticlesController < ApplicationController

	  before_filter :authenticate_user!, except: [:index, :show]
#this is a test
	  def new
	  	@article = Article.new
	  end

	  def create
			puts "Here  I am"
	  	@topics  = params[:article][:topics]

	  	params[:article].except!(:topics)

	  	params[:article][:user_id] = current_user.id

	  	p params

	  	@article = Article.create(article_params)

	  	#refactor - 2 saves
	  	if @article.save
	  		@article.topic_list.add(@topics, parse: true)
	  		@article.save
	  		redirect_to @article
	  	else
				render :new
	  	end
	  end

	  def show
	  	@article = Article.find(params[:id])
			@score = Article.rank(@article, @article.topic_list, true).ceil
			can_vote?(current_user, @article) if user_signed_in?
	  end

	  def index
	  	@article = Article.paginate(page: params[:page], per_page: 10)
	  end

	  def destroy

	  end

	  def update
	  	@article = Article.find(params[:id])
	  	if params[:up_vote] || params[:down_vote]
	  		begin
		  		if VotedOnRelationship.create!(user_id: current_user.id, article_id: @article.id)
		  			params[:up_vote] ? @article.up_vote += 1 : @article.down_vote += 1
			  		@article.save
		  		end
		  	rescue
		  		flash[:warning] = "Already voted?!?"
		  	end
	 	end
	  	redirect_to @article

	  end

		def can_vote?(user,article)
			@vote = true
			if VotedOnRelationship.find_by_user_id_and_article_id(user.id,
				article.id)
				@vote = false
			end

		end


private
	def article_params
		params.require(:article).permit(:name, :user_id, :url)
	end
end
