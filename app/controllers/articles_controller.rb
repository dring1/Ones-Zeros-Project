class ArticlesController < ApplicationController

	  before_filter :authenticate_user!, except: [:index, :show]
#thisis a test
	  def new
	  	@article = Article.new
	  end

	  def create

	  	@topics  = params[:article][:topics]

	  	params.except!(:topics)
	  	params[:article][:submitted_by] = current_user.id
	  	@article = Article.create(params)

	  	if @article.save
	  		@article.topics_list.add(@topics, parse: true)
	  		redirect_to @article
	  	else
	  	end
	  end

	  def show
	  	
	  end

	  def index
	  	
	  end

	  def destroy
	  	
	  end
private
	def article_params
	end	
end
