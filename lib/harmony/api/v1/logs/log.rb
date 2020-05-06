# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Logs
        module Log
          def get_logs(block_hash)
            params = [{"BlockHash" => block_hash}]
            response(post('hmy_getLogs', params: params))
          end
        end
      end
    end
  end
end
