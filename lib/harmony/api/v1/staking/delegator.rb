# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Staking
        module Delegator
          def get_delegations_by_delegator(address)
            response(post('getDelegationsByDelegator', params: [address]))
          end
        end
      end
    end
  end
end
