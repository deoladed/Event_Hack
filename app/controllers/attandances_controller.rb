class AttandancesController < ApplicationController
  def index
  end

  def new
  	p '33333333333333'
  	p params
  	@event = Event.find(params[:format])
  	session[:amount] = @event.price * 100
  	@amount = session[:amount]
  	session[:event_id] = params[:format] 
  end

  def create
  	p '66666666666666666'
  	p params
  end
end
