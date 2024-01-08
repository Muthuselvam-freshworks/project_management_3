class ApplicationController < ActionController::Base

    
    protected

    def after_sign_in_path_for(resource)
     
      dashboard_path
    end
  
    def after_sign_out_path_for(resource_or_scope)
      
      root_path
    end

  def after_sign_out_path_for(resource_or_scope)
    # Specify the path you want to redirect to after sign out
    new_user_session_path
  end
end
