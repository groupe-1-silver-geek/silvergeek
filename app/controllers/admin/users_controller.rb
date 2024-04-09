class Admin::UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

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

    protected
    
    def set_user
      @user = User.find(params[:id])
    end
end