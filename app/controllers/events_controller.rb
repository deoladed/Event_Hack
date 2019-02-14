class EventsController < ApplicationController
  before_action :set_event, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:edit, :new, :create]
  before_action :is_not_your_event, only: [:edit]


  def set_event
    @event = Event.find(params[:id])
  end

  def is_not_your_event
    unless @event.admin == current_user
      flash[:danger] = 'Back off ! Not your event !'
      redirect_to root_path
    end
  end

  def index
    @events = Event.all.by_soon_date
  end

  def show    
    @usersattandances = @event.attandances.map {|attandance| attandance.user }
  end

  def edit
  end

  def update
    post_params = params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  
    if @event.update(post_params)
      flash.now[:success] = "Your event have been successfully modified!"
      redirect_to event_attandances_path(@event.id)
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    post_params = params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)

    @event = Event.new(post_params)
    @event.admin = current_user

    if @event.save
      flash.now[:success] = "Your event have been successfully created! Thanks for your trust"
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    flash[:danger] = 'Event deleted'
    redirect_to root_path
   end
end
