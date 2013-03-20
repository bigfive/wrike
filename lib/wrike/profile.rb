module Wrike
  class Client

    # Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful;
    # returns a 401 status code and an error message if not.
    def authorized?
      oauth_response = access_token.get("/#{@api_version}/account/verify_credentials.json")
      return oauth_response.class == Net::HTTPOK
    end

    # Returns profile info
    def profile_get
      post('wrike.profile.get')
    end

  end
end
