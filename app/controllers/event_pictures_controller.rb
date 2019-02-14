class EventPicturesController < ApplicationController
		def create
	  @event = Event.find(params[:event_id])
	  unless params[:event_picture].nil?
	  	@event.event_picture.attach(params[:event_picture])
    	redirect_to event_attandances_path(@event.id)
	  else
	  	flash[:danger] = 'Please choose a picture'
	  	redirect_to event_attandances_path(@event.id)
	  end
  end
end
