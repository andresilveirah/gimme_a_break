# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "User name"
    uid "1234567890"
    provider "social_network"
    oauth_token "token"
    oauth_expires_at Date.tomorrow
  end
end
