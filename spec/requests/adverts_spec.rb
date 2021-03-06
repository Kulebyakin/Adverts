 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/adverts", type: :request do
  
  # Advert. As you add validations to Advert, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Advert.create! valid_attributes
      get adverts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      advert = Advert.create! valid_attributes
      get advert_url(advert)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_advert_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      advert = Advert.create! valid_attributes
      get edit_advert_url(advert)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Advert" do
        expect {
          post adverts_url, params: { advert: valid_attributes }
        }.to change(Advert, :count).by(1)
      end

      it "redirects to the created advert" do
        post adverts_url, params: { advert: valid_attributes }
        expect(response).to redirect_to(advert_url(Advert.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Advert" do
        expect {
          post adverts_url, params: { advert: invalid_attributes }
        }.to change(Advert, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post adverts_url, params: { advert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested advert" do
        advert = Advert.create! valid_attributes
        patch advert_url(advert), params: { advert: new_attributes }
        advert.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the advert" do
        advert = Advert.create! valid_attributes
        patch advert_url(advert), params: { advert: new_attributes }
        advert.reload
        expect(response).to redirect_to(advert_url(advert))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        advert = Advert.create! valid_attributes
        patch advert_url(advert), params: { advert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested advert" do
      advert = Advert.create! valid_attributes
      expect {
        delete advert_url(advert)
      }.to change(Advert, :count).by(-1)
    end

    it "redirects to the adverts list" do
      advert = Advert.create! valid_attributes
      delete advert_url(advert)
      expect(response).to redirect_to(adverts_url)
    end
  end
end
