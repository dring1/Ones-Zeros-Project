class CustomDevise::RegistrationsController <  Devise::RegistrationsController

	def create
		interests = params[:user][:interests] #acquire users interests 
		params[:user].except!(:interests) #remove interests from params
		super #call devises create

		@user = User.find_by(id: resource.id)
		@user.tag_list.add("default")
		if resource.save
		end
	end
end
