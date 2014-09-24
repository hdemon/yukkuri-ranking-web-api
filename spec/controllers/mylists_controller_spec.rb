require 'rails_helper'

describe MylistsController do
  let(:valid_session) { {} }

  def valid_attributes
    FactoryGirl.attributes_for(:mylist)
  end

  def invalid_attributes
    FactoryGirl.attributes_for(:mylist, mylist_id: "contains string")
  end

  describe "GET index" do
    it "responds mylists" do
      mylist = Mylist.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:mylists)).to eq([mylist])
    end
  end

  # describe "GET show" do
  #   it "assigns the requested mylist as @mylist" do
  #     mylist = Mylist.create! valid_attributes
  #     get :show, {:id => mylist.to_param}, valid_session
  #     expect(assigns(:mylist)).to eq(mylist)
  #   end
  # end

  describe "POST create" do
    context "when POST array of mylist data" do
      describe "with all valid params" do
        before do
          @post = [valid_attributes, valid_attributes]
          post :create, @post.to_json, valid_session
        end

        it "stores all posted params" do
          expect(Mylist.count).to be 2
          expect(Mylist.first.mylist_id).to be @post[0][:mylist_id]
          expect(Mylist.second.mylist_id).to be @post[1][:mylist_id]
        end

        it "responds status ok" do
          parsed = JSON.parse response.body
          expect(parsed["status"]).to eql "ok"
        end
      end

      describe "with params that contains invalid one" do
        before do
          @post = [valid_attributes, invalid_attributes]
          post :create, {:mylists => @post.to_json}, valid_session
        end

        it "stores the only part of valid params" do
          expect(Mylist.count).to be 1
          expect(Mylist.first.mylist_id).to be @post[0][:mylist_id]
        end

        it "respond error status detail" do
          parsed = JSON.parse response.body
          expect(parsed["status"]).to eql "failed partially or all"
        end
      end

      describe "with all invalid params" do
        before do
          @post = [invalid_attributes, invalid_attributes]
          post :create, {:mylists => @post.to_json}, valid_session
        end

        it "doesn't stores all posted params" do
          expect(Mylist.count).to be 0
        end

        it "responds error status detail" do
          parsed = JSON.parse response.body
          expect(parsed["status"]).to eql "failed partially or all"
        end
      end
    end
  end

end
