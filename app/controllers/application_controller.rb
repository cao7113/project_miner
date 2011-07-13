class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #此项目均为受限资源
  before_filter :login_required

  helper_method :current_user
  
  def login_required
    #debugger
    if !current_user
      respond_to do |format|
        format.html  { 
          redirect_to "/auth/#{UC_PROVIDER_NAME}"
        }
        format.json {
          render :json => { 'error' => 'Access Denied' }.to_json
        }
      end
    end
  end

  def current_user
    #TODO ERROR FIXME
    return nil unless session[:user_id]
    @current_user ||= User.find_by_uid(session[:user_id])
  end
end
