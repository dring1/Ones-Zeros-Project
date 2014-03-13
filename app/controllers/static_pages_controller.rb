class StaticPagesController < ApplicationController

  def home
    puts "PARAMS #{params}"
  	if user_signed_in?
      @user ||= current_user
      @user.recommended_list = nil if params[:reset]
      @user.recommended_list ||= Article.recommend(current_user.interest_list).to_json
      @user.save
      @list = {}
      JSON.parse(@user.recommended_list).each {|k,v| @list[Article.find_by(id: k)] = v  }

      respond_to do |format|
        format.html{puts "MEOW"}
        format.js {render @list}
      end
  	end
  end

  def about
  end

  def spec_rec
    @list_spec = {}
    @list_spec = Article.specific_recommend(params[:tag])
    @tag_name = params[:tag]
    #render 'layouts/_spec_output'
  end
end
