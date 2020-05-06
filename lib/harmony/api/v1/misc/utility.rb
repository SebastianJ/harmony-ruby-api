# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Misc
        module Utility
          def get_circulating_supply
            response(post('getCirculatingSupply'))&.to_f
          end

          def get_total_supply
            response(post('getTotalSupply'))&.to_f
          end
        end
      end
    end
  end
end
