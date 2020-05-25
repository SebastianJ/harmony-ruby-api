# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Staking
        module Transaction
          def send_raw_staking_transaction(hash)
            response(post('sendRawStakingTransaction', params: [hash]))
          end

          def get_staking_transaction_by_hash(hash)
            response(post('getStakingTransactionByHash', params: [hash]))
          end

          def get_staking_transaction_by_block_number_and_index(block_number, index)
            params = [Harmony::Api::Utilities.int_to_hex(block_number), Harmony::Api::Utilities.int_to_hex(index)]
            response(post('getStakingTransactionByBlockNumberAndIndex', params: params))
          end

          def get_staking_transaction_by_block_hash_and_index(hash, index)
            params = [hash, Harmony::Api::Utilities.int_to_hex(index)]
            response(post('getStakingTransactionByBlockHashAndIndex', params: params))
          end
          
          def get_staking_transactions_history(address, page_index: 0, page_size: 1000, full_txs: false, tx_type: :all, order: :asc)
            params = [
              {
                'address'   => address,
                'pageIndex' => page_index,
                'pageSize'  => page_size,
                'fullTx'    => full_txs,
                'txType'    => tx_type.to_s.upcase,
                'order'     => order.to_s.upcase
              }
            ]
            
            response(post('getStakingTransactionsHistory', params: params))
          end
          
        end
      end
    end
  end
end
