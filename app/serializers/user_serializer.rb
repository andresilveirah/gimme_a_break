class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :uid, :oauth_token, :oauth_expires_at
end
