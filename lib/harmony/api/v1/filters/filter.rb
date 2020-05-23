# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Filters
        module Filter
          # get_filter_logs returns the logs for the filter with the given id.
          # If the filter could not be found an empty array of logs is returned.
          def get_filter_logs(filter_id)
            params = [Harmony::Api::Utilities.int_to_hex(filter_id)]
            response(post('getFilterLogs', params: params))
          end

          def get_filter_changes(filter_id)
            params = [Harmony::Api::Utilities.int_to_hex(filter_id)]
            response(post('getFilterChanges', params: params))
          end

          def new_filter(block_hash)
            response(post('newFilter', params: [block_hash]))
          end

          def new_pending_transaction_filter(topics: [])
            params = [{ topics: topics }]
            response(post('newPendingTransactionFilter', params: params))
          end

          def new_block_filter(_block_hash)
            response(post('newBlockFilter'))
          end
        end
      end
    end
  end
end
