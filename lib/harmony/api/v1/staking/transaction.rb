# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Staking
        module Transaction
          def send_raw_staking_transaction(hash)
            response(post('sendRawStakingTransaction', params: [hash]))
          end

          def send_raw_staking_transaction(hash)
            response(post('getStakingTransactionByHash', params: [hash]))
          end

          def get_staking_transaction_by_block_number_and_index(block_number, index)
            params = [Harmony::Api::Utilities.int_to_hex(block_number), Harmony::Api::Utilities.int_to_hex(index)]
            response(post('hmy_getStakingTransactionByBlockNumberAndIndex', params: params))
          end

          def get_staking_transaction_by_block_hash_and_index(hash, index)
            params = [hash, Harmony::Api::Utilities.int_to_hex(index)]
            response(post('getStakingTransactionByBlockHashAndIndex', params: params))
          end
        end
      end
    end
  end
end
