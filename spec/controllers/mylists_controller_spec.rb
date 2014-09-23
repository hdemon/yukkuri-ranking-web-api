require 'rails_helper'

describe MylistsController do

  # This should return the minimal set of attributes required to create a valid
  # Mylist. As you add validations to Mylist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MylistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all mylists as @mylists" do
      mylist = Mylist.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:mylists)).to eq([mylist])
    end
  end

  describe "GET show" do
    it "assigns the requested mylist as @mylist" do
      mylist = Mylist.create! valid_attributes
      get :show, {:id => mylist.to_param}, valid_session
      expect(assigns(:mylist)).to eq(mylist)
    end
  end

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

      it "redirects to the created mylist" do
        post :create, {:mylist => valid_attributes}, valid_session
        expect(response).to redirect_to(Mylist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mylist as @mylist" do
        post :create, {:mylist => invalid_attributes}, valid_session
        expect(assigns(:mylist)).to be_a_new(Mylist)
      end

      it "re-renders the 'new' template" do
        post :create, {:mylist => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
