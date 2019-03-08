class Admins::UsersController < ApplicationController
  before_action :authenticate_admin
	before_action :define_user, only: [:show, :edit, :update]
	layout 'admins'

  def define_user
    @user = User.find(params[:id])
  end

	def index
		@users = User.all
	end

	def show    
	end

	def edit
	end

	def update
    post_params = params.require(:user).permit(:first_name, :last_name, :description)

    if @user.update(post_params)
      flash[:success] = 'Profile updated'
      redirect_to admins_users_path
    else
      render :edit
    end
	end

	def destroy
    User.find(params[:id]).destroy
    flash[:danger] = 'User deleted'
    redirect_to admins_users_path
   end
end
