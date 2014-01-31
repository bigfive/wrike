require 'wrike/profile'
require 'wrike/contacts'
require 'wrike/folders'
require 'wrike/tasks'
require 'wrike/comments'
require 'wrike/attachments'
require 'wrike/time_logs'
require 'wrike/utils'

module Wrike
  class Client

    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @token = options[:token]
      @secret = options[:secret]
      @proxy = options[:proxy]
      @debug = options[:debug]
      @response_format = options[:response_format] || 'json'
      @api_version = options[:api_version] || 'v2'
      @api_host = options[:api_host] || 'wrike.com'
      @api_request_token_path = options[:request_token_path] || '/rest/auth/request_token'
      @api_authorize_path = options[:authorize_path] || '/rest/auth/authorize'
      @api_access_token_path = options[:access_token_path] || '/rest/auth/request_token'
    end

    def authorize(token, secret, options = {})
      request_token = OAuth::RequestToken.new(
        consumer(:secure => true), token, secret
      )
      @access_token = request_token.get_access_token(options)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end

    def request_token(options={})
      consumer(:secure => true).get_request_token(options)
    end

    private

      def consumer(options={})
        options[:secure] ||= false
        protocol = options[:secure] ? 'https' : 'http'
        @consumer ||= OAuth::Consumer.new(
          @consumer_key,
          @consumer_secret,
          { 
            :site               => "#{protocol}://#{@api_host}",
            :request_endpoint   => @proxy,
            :request_token_path => @api_request_token_path,
            :authorize_path     => @api_authorize_path,
            :access_token_path  => @api_access_token_path
          }
        )
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end

      def get(path, headers={})
        headers.merge!("User-Agent" => "wrike gem v#{Wrike::VERSION}")
        oauth_response = access_token.get("/api/#{@response_format}/#{@api_version}/#{path}", headers)
        parse(oauth_response.body)
      end

      def post(path, body='', headers={})
        headers.merge!("User-Agent" => "wrike gem v#{Wrike::VERSION}")
        oauth_response = access_token.post("/api/#{@response_format}/#{@api_version}/#{path}", body, headers)
        parse(oauth_response.body)
      end

      def delete(path, headers={})
        headers.merge!("User-Agent" => "wrike gem v#{Wrike::VERSION}")
        oauth_response = access_token.delete("/api/#{@response_format}/#{@api_version}/#{path}", headers)
        parse(oauth_response.body)
      end

      def parse(response_body)
        begin
          JSON.parse(response_body)
        rescue JSON::ParserError
          {:response => response_body}.to_json
        end
      end
  end
end

