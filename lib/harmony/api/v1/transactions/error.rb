# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Transactions
        module Error
          def getCurrentTransactionErrorSink
            response(post('getCurrentTransactionErrorSink'))
          end
        end
      end
    end
  end
end
