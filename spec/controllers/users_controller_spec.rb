require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){ create(:user) }
  before :each do
    sign_in(user)
  end
  context '#sign_in' do
    it 'have current_user' do
      expect(subject.current_user).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "finds the specified user" do
      get :edit, :id => user.id
      expect(assigns(:user)).to eq(user)
    end

  end

  describe "PATCH #update" do
    before{ user }
    let(:updated_about_me){ "updated about me" }
    it "finds the specified user" do
      put :update, :id => user.id,
                   :user => attributes_for(:user,
                                           :about_me => updated_about_me)
      expect(assigns(:user)).to eq(user)
    end

    it "redirect to the updated user" do
      put :update, :id => user.id,
                   :user => attributes_for(:user,
                                           :about_me => updated_about_me)
      expect(response).to redirect_to user_path(assigns(:user))
    end

    it "actually updates the user" do
      put :update, :id => user.id,
                   :user => attributes_for(:user,
                                           :about_me => updated_about_me)
      user.reload
      expect(user.about_me).to eq(updated_about_me)
    end
  end
end
