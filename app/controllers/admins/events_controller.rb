class Admins::EventsController < ApplicationController
	before_action :authenticate_admin
	layout 'admins'
	def index
	end

	def show
	end
end
