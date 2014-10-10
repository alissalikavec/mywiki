require 'spec_helper'

RSpec.describe StaticPagesController, :type => :controller do
	
	describe "GET home" do
		it "gets the home page" do
			get :home 
			expect(response).to render_template :home
		end
	end

end