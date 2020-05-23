# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'logger'

require 'harmony/api/version'
require 'harmony/api/configuration'

require 'harmony/api/utilities'

require 'harmony/api/client'

require 'harmony/api/v1/blockchain/protocol'
require 'harmony/api/v1/blockchain/block'
require 'harmony/api/v1/accounts/account'
require 'harmony/api/v1/misc/utility'
require 'harmony/api/v1/transactions/transaction'
require 'harmony/api/v1/transactions/error'
require 'harmony/api/v1/staking/validator'
require 'harmony/api/v1/staking/delegator'
require 'harmony/api/v1/staking/transaction'
require 'harmony/api/v1/staking/utility'
require 'harmony/api/v1/staking/error'
require 'harmony/api/v1/contracts/contract'
require 'harmony/api/v1/filters/filter'
require 'harmony/api/v1/logs/log'
require 'harmony/api/v1/client'

module Harmony
  module Api
    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= ::Harmony::Api::Configuration.new
      end

      def reset
        @configuration = ::Harmony::Api::Configuration.new
      end

      def configure
        yield(configuration)
      end
    end

    class Error < StandardError; end
  end
end
