# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Accounts
        module Account
          def get_balance(address)
            params = [address, 'latest']
            wei = response(post('getBalance', params: params))&.to_i(16)
            Harmony::Api::Utilities.wei_to_ether(wei)
          end

          def get_balance_by_block_number(address, block_number)
            params = [address, Harmony::Api::Utilities.int_to_hex(block_number)]
            wei = response(post('getBalanceByBlockNumber', params: params))&.to_i(16)
            Harmony::Api::Utilities.wei_to_ether(wei)
          end

          def get_transaction_count(address)
            params = [address, 'latest']
            response(post('getTransactionCount', params: params))&.to_i(16)
          end
        end
      end
    end
  end
end
