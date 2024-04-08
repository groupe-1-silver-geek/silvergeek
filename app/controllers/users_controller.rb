class UsersController < ApplicationController
    before_action :authenticate_user!, :ensure_admin

    protected
    
    def ensure_admin
      redirect_to root_path unless current_user.admin?
    end
 
    def index
        @users = User.all
    end

    def show
    end 

    def update  
        if @user.update(user_params)
            redirect_to @user, notice: 'Le compte a bien été mis à jour.'
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to users_url, notice: 'Le compte a bien été supprimé.'
    end


end