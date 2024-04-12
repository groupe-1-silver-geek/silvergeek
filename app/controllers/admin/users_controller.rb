class Admin::UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @usersAnimator = User.all.select(&:animator?)
        @usersPending = User.all.select(&:pending?)
        @usersPartner = User.all.select(&:partner?)
    end

    def show
    end 

    def update  
        if @user.update(user_params)
            redirect_to [:admin, @user], notice: 'Le compte a bien été mis à jour.'
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to admin_users_url, notice: 'Le compte a bien été supprimé.'
    end

    protected
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:partner_id, :partner_admin)
    end
end