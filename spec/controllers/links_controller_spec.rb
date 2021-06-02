require "rails_helper"

RSpec.describe LinksController, type: :controller do

  let(:params) { { link: { url: Faker::Internet.domain_name } } }

  describe "POST #create" do
    it "creates a shorcode link when valid attributes" do
      request.env["HTTP_ACCEPT"] = "text/javascript"
      post :create, params: params
      link = assigns(:link)
      expect(link).to be_instance_of(Link) 
      expect(response).to render_template("create")  
    end
  end

  describe "GET /:short_code" do
    
    let(:link1) { build :link, short_code: "aw342", expired_at: Date.today+1.month }
    it "redirect to orginal url if it is not expired" do
      get(:show, params: { short_code: link1.short_code })
      expect(response).to redirect_to(link1.url)
      expect(response.status).to eq(302)
    end

    let(:link) { build :link, short_code: "dgt22", expired_at: Date.today-1.month }
    it "redirect to 404 page if it is expired" do
      get(:show, params: { short_code: link.short_code })
      expect(response).to render_template('errors/404')
      expect(response.status).to eq(404)
    end
  end


end
