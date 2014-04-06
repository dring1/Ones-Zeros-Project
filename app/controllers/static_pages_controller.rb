class StaticPagesController < ApplicationController

  def home
    puts "PARAMS #{params}"
    get_recommendations(false)
  end

  def about
  end

  def refresh_spec
    puts "CALLED"
    @list_spec = {}
    @list_spec = Article.specific_recommend(params[:tag])
    @tag_name = params[:tag]
    respond_to do |format|
      format.html
      format.js
    end
    #render 'layouts/_spec_output'
  end

  def refresh
     get_recommendations(true)
     respond_to do |format|
      #format.html {render partial: 'refresh'}
      format.js
     end

  end

private
  def get_recommendations(reset)
    if user_signed_in?
      @user ||= current_user
      #if the user has clicked new recommentatoins
      #then set the current list to nil
      @user.recommended_list = nil if reset
      @user.recommended_list ||= Article.recommend(current_user.interest_list).to_json
      @user.save
      @list = {}
      JSON.parse(@user.recommended_list).each {|k,v| @list[Article.find_by(id: k)] = v  }
      puts @list
      # respond_to do |format|
      #   format.html{}
      #   format.js { render partial: 'refresh'}
      # end

      #render partial: 'recommended'

    end
  end

end
