# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Contracts
        module Contract
          def estimate_gas
            response(post('estimateGas'))
          end

          # get storage position at a given address
          def get_storage_at(address, key, block_number)
            params = [address, key, Harmony::Api::Utilities.int_to_hex(block_number)]
            response(post('getStorageAt', params: params))
          end

          # call contract method
          def call(address)
            params = [{ to: address }, 'latest']
            response(post('call', params: params))
          end

          # get deployed contract's byte code
          def get_code(address)
            params = [address, 'latest']
            response(post('getCode', params: params))
          end
        end
      end
    end
  end
end
