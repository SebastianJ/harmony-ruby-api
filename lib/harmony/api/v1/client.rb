# frozen_string_literal: true

module Harmony
  module Api
    module V1
      class Client < ::Harmony::Api::Client
        def initialize(network: :mainnet, shard: 0, configuration: ::Harmony::Api.configuration, options: {})
          self.api_version = 1
          super
        end

        include ::Harmony::Api::V1::Blockchain::Protocol
        include ::Harmony::Api::V1::Blockchain::Block
        include ::Harmony::Api::V1::Accounts::Account
        include ::Harmony::Api::V1::Misc::Utility
        include ::Harmony::Api::V1::Transactions::Transaction
        include ::Harmony::Api::V1::Transactions::Error
        include ::Harmony::Api::V1::Staking::Validator
        include ::Harmony::Api::V1::Staking::Delegator
        include ::Harmony::Api::V1::Staking::Transaction
        include ::Harmony::Api::V1::Staking::Utility
        include ::Harmony::Api::V1::Staking::Error
        include ::Harmony::Api::V1::Contracts::Contract
      end
    end
  end
end
