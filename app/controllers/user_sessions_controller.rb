class UserSessionsController < ApplicationController
  before_filter :login_required, :only => [ :destroy ]

  respond_to :html

  # omniauth callback method 
  def create
    omniauth = request.env['omniauth.auth']   
    logger.debug "====omniauth user info: #{omniauth.inspect} ..."
    user = User.find_by_uid(omniauth['uid'])
    if not user
      # New user registration
      user = User.create!(:uid => omniauth['uid'], 
                          :name => omniauth['user_info']['name'],
                          :email => omniauth['user_info']['email'])
    end

    # Currently storing all the info
    session[:user_id] = omniauth['uid']
    
    flash[:notice] = "Successfully logged in"
    redirect_to root_path
  end

  # Omniauth failure callback
  def failure
    flash[:notice] = params[:message]
    redirect_to root_path
  end

  # logout - Clear our rack session BUT essentially redirect to the provider
  # to clean up the Devise session from there too !
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully signed out!'
    redirect_to "#{UC_PROVIDER_URL}/sign_out?client_id=#{UC_APP_ID}"
  end
end
