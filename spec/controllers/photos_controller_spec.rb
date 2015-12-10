require 'rails_helper'

describe PhotosController, type: :controller do
  render_views

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads flickr photos into @photos" do
      get :index, { search: 'Australian Art' }
      expect(assigns(:photos).length).to eq(30)
    end
  end
end
