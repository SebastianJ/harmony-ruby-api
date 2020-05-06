# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Blockchain
        module Protocol
          def protocol_version
            response(post('protocolVersion'))&.to_i(16)
          end

          def get_sharding_structure
            response(post('getShardingStructure'))
          end

          def get_leader
            response(post('getLeader'))
          end

          def get_epoch
            response(post('getEpoch'))&.to_i(16)
          end

          def gas_price
            response(post('gasPrice'))&.to_i(16)
          end

          def get_node_metadata
            response(post('getNodeMetadata'))
          end

          def syncing
            response(post('syncing'))
          end
        end
      end
    end
  end
end
