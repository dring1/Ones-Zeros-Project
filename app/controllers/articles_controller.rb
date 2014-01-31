class ArticlesController < ApplicationController

	  before_filter :authenticate_user!, except: [:index, :show]


	  def new
	  end

	  def create
	  end

	  def show
	  	
	  end

	  def index
	  	
	  end

	  def destroy
	  	
	  end

end
