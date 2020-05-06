# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Staking
        module Error
          def get_current_staking_error_sink
            response(post('getCurrentStakingErrorSink'))
          end
        end
      end
    end
  end
end
