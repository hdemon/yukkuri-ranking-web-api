require 'rails_helper'

describe MylistsController do
  let!(:valid_attributes) { FactoryGirl.attributes_for(:mylist).to_json }
  let!(:invalid_attributes) { FactoryGirl.attributes_for(:mylist, mylist_id: "contains string").to_json }

  let(:valid_session) { {} }

  # describe "GET index" do
  #   it "assigns all mylists as @mylists" do
  #     mylist = Mylist.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:mylists)).to eq([mylist])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested mylist as @mylist" do
  #     mylist = Mylist.create! valid_attributes
  #     get :show, {:id => mylist.to_param}, valid_session
  #     expect(assigns(:mylist)).to eq(mylist)
  #   end
  # end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Mylist" do
        expect {
          post :create, {:mylist => valid_attributes}, valid_session
        }.to change(Mylist, :count).by(1)
      end

      it "assigns a newly created mylist as @mylist" do
        post :create, {:mylist => valid_attributes}, valid_session

        expect(assigns(:mylist)).to be_a(Mylist)
        expect(assigns(:mylist)).to be_persisted
      end

      it "respond status and requested data as json" do
        post :create, {:mylist => valid_attributes}, valid_session

        expect(response.body).to include "\"status\":\"ok\""
        expect(response.body).to include valid_attributes["title"]
        expect(response.body).to include valid_attributes["mylist_id"].to_s
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mylist as @mylist" do
        post :create, {:mylist => invalid_attributes}, valid_session
        expect(assigns(:mylist)).to be_a_new(Mylist)
      end

      it "respond error status detail and requested data as json" do
        post :create, {:mylist => invalid_attributes}, valid_session

        expect(response.body).not_to include "\"status\":\"ok\""
        expect(response.body).to include invalid_attributes["title"]
        expect(response.body).to include invalid_attributes["mylist_id"].to_s
      end
    end

    # context "when POST array of mylist data" do
    #   describe "with valid params" do
    #     it "assigns a newly created mylists as @mylists" do
    #       post :create, {:mylist => valid_attributes}, valid_session

    #       expect(assigns(:mylist)).to be_a(Mylist)
    #       expect(assigns(:mylist)).to be_persisted
    #     end
    #   end
    # end
  end

end
