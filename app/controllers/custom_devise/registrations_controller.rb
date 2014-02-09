class CustomDevise::RegistrationsController <  Devise::RegistrationsController

	def create
		interests = params[:user][:interests] #acquire users interests 
		params[:user].except!(:interests) #remove interests from params
		super #call devises create

		#may require refactoring
		# take the resource and save to the DB
		# find the resource and add the appropriate tags
		# save again  #
		if resource.save
			@user = User.find_by(id: resource.id)
			@user.interest_list.add(interests, parse: true)
			if @user.save
			else
				flash[:error].now = "Did not save tags"
			end
		end
	end
end
