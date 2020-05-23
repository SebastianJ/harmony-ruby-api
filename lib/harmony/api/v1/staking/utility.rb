# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Staking
        module Utility
          def get_current_utility_metrics
            response(post('getCurrentUtilityMetrics'))
          end

          def get_super_committees
            response(post('getSuperCommittees'))
          end

          def get_staking_network_info
            response(post('getStakingNetworkInfo'))
          end

          def get_median_raw_stake_snapshot
            response(post('getMedianRawStakeSnapshot'))
          end
        end
      end
    end
  end
end
