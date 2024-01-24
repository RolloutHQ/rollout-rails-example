require 'jwt'

class IntegrationsController < ApplicationController
  def index
    generate_jwt
  end

  

  def generate_jwt
    @rollout_token = JWT.encode(
      {
        iss: ENV['ROLLOUT_PROJECT_KEY'], # Provided in the Rollout dashboard
        sub: current_user[:id].to_s, # Persistent ID for the current user
        iat: DateTime.now.to_i, # Time token was generated
        exp: DateTime.now.to_i + 60 * 10000 # Token expiration
      },
      ENV['ROLLOUT_CLIENT_SECRET'], # Provided in the Rollout dashboard
      'HS512'
    )
  end

  # Mock function for current_user without implementing auth
  # Use a real implementation in production
  def current_user
    {id: 'testId'}
  end
end
