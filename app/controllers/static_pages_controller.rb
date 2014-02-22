class StaticPagesController < ApplicationController
  def home
  	@list = []
  	if user_signed_in?
  		@list = Article.recommend(current_user.interest_list)
  	end
  end

  def about
  end
end
