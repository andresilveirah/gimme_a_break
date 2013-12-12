require 'spec_helper'

describe User do
  describe "validations" do
    [:name, :uid, :provider, :oauth_token, :oauth_expires_at].each do |attr|
      it "should contain #{attr.to_s}" do
        attributes = attributes_for(:user)
        attributes.delete(attr)
        user = User.new(attributes)
        user.valid?.should be_false
      end
    end
  end
  
  describe "from_omniauth method" do
    pending 
  end
end
