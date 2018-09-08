require 'rails_helper'

describe RegistrationsController do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    before :each do
      post :create, user: attributes_for(:user)
    end
    it 'redirects to rooth_path' do
      expect(response).to redirect_to root_path
    end
  end
end
