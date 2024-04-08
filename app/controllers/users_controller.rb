class UsersController < ApplicationController
    before_action :authenticate_user!, :ensure_admin

    protected
    
    # 
    def ensure_admin
      redirect_to root_path unless current_user.admin?
    end



end