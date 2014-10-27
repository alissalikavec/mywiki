class ChargesController < ApplicationController
  before_filter :authenticate_user!

  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "MyWiki Premium Upgrade",
     amount: 5_99
   }
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
   
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 5_99,
      description: "MyWiki Membership",
      currency: 'usd'
    )

    current_user.premium = true
    current_user.save
    flash[:success] = "Thank you for your payment you are now a premium user"
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end