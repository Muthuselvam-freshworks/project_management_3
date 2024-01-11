class ApplicationController < ActionController::Base

    protected
    #after signin redirecting helper method
    def after_sign_in_path_for(resource) 
      dashboard_path
    end

  #after signout redirecting helper method
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

  #after signout redirecting to signup 
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
