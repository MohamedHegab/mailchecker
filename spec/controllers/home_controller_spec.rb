require 'rails_helper'

describe HomeController do
  let(:valid_SMTP_email) {"mohamedhegab92@gmail.com"}
  
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Post check" do
    it "renders the index template" do
      post :check_email, params: {email: valid_SMTP_email}
      expect(response).to render_template("index")
    end
  end
end