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

		@amount = session[:amount]
  
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer', # CCE QUE JE VEUX QUI A DU SESNS
	    :currency    => 'usd'
	  )


		@attandance = Attandance.new(user: current_user, event: Event.find(session[:event_id]))
		@attandance.stripe_customer_id = params[:stripeToken]

		if @attandance.save
			flash[:success] = 'Reservation reussie !'
			redirect_to event_path(session[:event_id])
		else
			flash[:error] = 'Erreur lors de la reservation'
			render :new
		end
		
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
