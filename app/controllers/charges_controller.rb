class ChargesController < ApplicationController
  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "MyWiki Membership",
     amount: 5_99
   }
  end

  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: 'textuser@example.com',
     card: params[:stripeToken]
   )
 
   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: 5_99,
     description: "MyWiki Membership",
     currency: 'usd'
   )
 
   flash[:success] = "Thank you for your payment you are now a premium user"
   # this is where we allow user to make wiki's private
   redirect_to root_path
   
   # rescue Stripe::CardError => e
   #   flash[:error] = e.message
   #   redirect_to new_charge_path
  end

end