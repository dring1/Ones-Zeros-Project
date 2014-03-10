class StaticPagesController < ApplicationController
  def home
  	@list = {}
  	if user_signed_in?
  		@list = Article.recommend(current_user.interest_list)  			
  	end
  end

  def about
  end

  def spec_rec
    @list_spec = {}
    if user_signed_in?
      @list_spec = Article.specific_recommend(params[:tag])
    end
    render 'layouts/_spec_output'
  end

end
