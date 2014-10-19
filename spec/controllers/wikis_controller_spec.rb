require 'spec_helper'

RSpec.describe WikisController, :type => :controller do

  describe "GET index" do
    it "gets the wikis index" do
      get :index
      expect(response).to render_template :index
    end
  end

end
