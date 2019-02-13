class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:secret, :show]
  before_action :is_not_your_profile, only: [:show, :edit]
  before_action :define_user, only: [:show, :edit, :update]

  def define_user
    @user = User.find(params[:id])
  end

  def is_not_your_profile
    unless params[:id].to_i == current_user.id
      flash[:danger] = 'Back off ! Not your profile !'
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    post_params = params.require(:user).permit(:first_name, :last_name, :description)

    if @user.update(post_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render :edit
    end
	end
	
  def secret
  end
end
