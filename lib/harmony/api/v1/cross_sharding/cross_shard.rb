# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module CrossSharding
        module CrossShard
          def get_cross_shard_transactions_history(address, page_index: 0, page_size: 1000, full_txs: false, tx_type: :all, order: :asc)
            params = [
              {
                'address' => address,
                'pageIndex' => page_index,
                'pageIndex' => page_size,
                'fullTx' => full_txs,
                'txType' => tx_type.to_s.upcase,
                'order' => order.to_s.upcase
              }
            ]
            response(post('getCrossShardTransactionsHistory', params: params))
          end

          def get_pending_cx_receipts
            response(post('getPendingCXReceipts'))
          end

          def get_cx_receipt_by_hash(hash)
            response(post('getCXReceiptByHash', params: [hash]))
          end

          def resend_cx(hash)
            response(post('resendCx', params: [hash]))
          end
        end
      end
    end
  end
end
