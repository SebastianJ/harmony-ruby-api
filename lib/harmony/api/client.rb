# frozen_string_literal: true

module Harmony
  module Api
    class Client
      attr_accessor :url, :payload, :configuration, :connection, :headers, :api_version

      def initialize(network: :os, shard: 0, configuration: ::Harmony::Api.configuration, options: {})
        self.configuration = configuration

        set_url(network, shard)
        set_defaults
        set_connection
      end

      def set_url(network, shard)
        self.url = configuration.networks[network][:url] % shard
      end

      def set_defaults
        self.payload = {
          jsonrpc: '2.0',
          id: 1
        }
      end

      def set_connection
        self.connection = ::Faraday.new(url) do |builder|
          if configuration.faraday.fetch(:timeout, nil)
            builder.options[:timeout]         =   configuration.faraday.fetch(:timeout, nil)
          end
          if configuration.faraday.fetch(:open_timeout, nil)
            builder.options[:open_timeout]    =   configuration.faraday.fetch(:open_timeout, nil)
          end

          builder.headers = headers if headers && !headers.empty?

          builder.request :json

          if configuration.verbose
            builder.response :logger, ::Logger.new(STDOUT), bodies: true
          end
          builder.response :json, content_type: /\bjson$/

          builder.use ::FaradayMiddleware::FollowRedirects, limit: 10

          builder.adapter configuration.faraday.fetch(:adapter, ::Faraday.default_adapter)
        end
      end

      def post(method, params: [])
        versioned_method = api_version.eql?(1) ? "hmy_#{method}" : "hmyv#{version}_#{method}"

        data = payload.merge(
          method: versioned_method,
          params: params
        )

        response = connection.post do |request|
          if headers && !headers.empty?
            request.headers = connection.headers.merge(headers)
          end
          request.body = data if data && !data.empty?
        end
      end

      def response(resp)
        resp = resp&.body

        error = resp&.fetch('error', {})
        unless error.empty?
          raise ::Harmony::Api::Error, "#{error.fetch('message', '')} (#{error.fetch('code', -1)})"
        end

        resp&.fetch('result')
      end

      def log(tag = self.class.name, message)
        puts "[#{tag}] - #{Time.now}: #{message}" if configuration.verbose
      end
    end
  end
end
