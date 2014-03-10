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
      @list_spec = Article.specific_recommend(params[:tag])
      @tag_name = params[:tag]
    render 'layouts/_spec_output'
  end

end
