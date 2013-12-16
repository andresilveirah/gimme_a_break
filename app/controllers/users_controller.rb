class UsersController < ApplicationController
  def show
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    begin
      @friends = @graph.get_connections("me", "friends")
    rescue Koala::Facebook::AuthenticationError => e
      redirect_to '/auth/facebook'
    end
  end
end
