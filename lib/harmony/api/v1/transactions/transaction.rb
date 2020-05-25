# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Transactions
        module Transaction
          def get_send_raw_transaction(hash)
            response(post('getBalance', params: [hash]))
          end

          def get_transaction_by_hash(hash)
            response(post('getTransactionByHash', params: [hash]))
          end

          def get_transaction_receipt(hash)
            response(post('getTransactionReceipt', params: [hash]))
          end

          def get_transaction_by_block_number_and_index(block_number, index)
            params = [Harmony::Api::Utilities.int_to_hex(block_number), Harmony::Api::Utilities.int_to_hex(index)]
            response(post('getTransactionByBlockNumberAndIndex', params: params))
          end

          def get_transaction_by_block_hash_and_index(hash, index)
            params = [hash, Harmony::Api::Utilities.int_to_hex(index)]
            response(post('getTransactionByBlockHashAndIndex', params: params))
          end

          def pending_transactions
            response(post('getTransactionByBlockHashAndIndex'))
          end

          def get_transactions_history(address, page_index: 0, page_size: 1000, full_txs: false, tx_type: :all, order: :asc)
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
            
            response(post('getTransactionsHistory', params: params))
          end
          
        end
      end
    end
  end
end
