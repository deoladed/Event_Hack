class ChargesController < ApplicationController
	def new
		  	p '5555555555555555'
  	p params
	end

	def create
		  	p '1111111111111111111111'
  	p params
	  # Amount in cents
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

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
