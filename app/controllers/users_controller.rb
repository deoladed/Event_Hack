class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:secret, :show]

  def show
  end

  def secret
  end
end
