class SubscriptionsController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      :card => params[:stripeToken],
      :plan => "wikijuju_premium",
      :email => current_user.email
    )

    current_user.stripe_id = customer.id 
    current_user.premium = true
    current_user.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
