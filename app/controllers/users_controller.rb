class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:secret, :show]

  def show
  end

  def edit
  end

  def update
	end
	
  def secret
  end
end
