class ArticlesController < ApplicationController

	  before_filter :authenticate_user!, except: [:index, :show]
#this is a test
	  def new	
	  	@article = Article.new
	  end

	  def create

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
	  	end
	  end

	  def show
	  	@article = Article.find(params[:id])	  	
	  end

	  def index
	  	@article = Article.all
	  end

	  def destroy
	  	
	  end
private
	def article_params
		params.require(:article).permit(:name, :user_id)
	end	
end
