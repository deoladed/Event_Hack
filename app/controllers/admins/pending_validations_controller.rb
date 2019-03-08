class Admins::PendingValidationsController < ApplicationController
  def index
  	@events = Event.all
  end

  def create
  @event = Event.find(params[:format])
  	if @event.update(validated: false)
  		flash.now[:success] = 'Event validated'
  		redirect_to admins_pending_validations_path
  	else
  		flash.now[:error] = 'Rate'
  		render :index
  	end
  end

  def show
  end

  def edit
  end

  def update
  	@event = Event.find(params[:id])
  	if @event.update(validated: true)
  		flash.now[:success] = 'Event validated'
  		redirect_to admins_pending_validations_path
  	else
  		flash.now[:error] = 'Rate'
  		render :index
  	end
  end
end
