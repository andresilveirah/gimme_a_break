require 'spec_helper'
describe SessionsController do
  describe "GET create" do
    before(:each) do
      stub_env_for_omniauth
      get :create, provider: 'facebook'
      @user = User.where(uid: '1234567', provider: 'facebook').first
    end
    it "should load an user object in the session" do
      expect(session[:user_id]).to be_equal(@user.id)
    end
    
    it "should redirect show user" do
      expect(response).to redirect_to(user_url(@user.id))
    end
  end
  
  describe "DELETE destroy" do
    it "should delete the user session" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
    
    it "should redirect to root path" do
      delete :destroy
      expect(response).to redirect_to(root_url)
    end
  end
end
  
def stub_env_for_omniauth
  env = { "omniauth.auth" => OmniAuth::AuthHash.new({
    :provider => 'facebook',
    :uid => '1234567',
    :info => {
      :email => 'joe@bloggs.com',
      :name => 'Joe Bloggs',
      :image => 'http://graph.facebook.com/1234567/picture?type=square'
    },
    :credentials => {
      :token => 'ABCDEF...',
      :expires_at => 1321747205
    }
    })}
    @controller.stub(:env).and_return(env)
  end
