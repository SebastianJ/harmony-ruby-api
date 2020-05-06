# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Staking
        module Validator
          def get_validators(epoch)
            response(post('getValidators', params: [epoch]))
          end

          def get_all_validator_addresses
            response(post('getAllValidatorAddresses'))
          end

          def get_elected_validator_addresses
            response(post('getElectedValidatorAddresses'))
          end

          def get_validator_information(address)
            response(post('getValidatorInformation', params: [address]))
          end

          def get_all_validator_information(page: -1)
            response(post('getAllValidatorInformation', params: [page]))
          end

          def get_all_validator_information_by_block_number(page: -1, block_number: 0)
            params = [page, Harmony::Api::Utilities.int_to_hex(block_number)]
            response(post('getAllValidatorInformationByBlockNumber', params: params))
          end

          def is_block_signer(address, block_number: 0)
            params = [Harmony::Api::Utilities.int_to_hex(block_number), address]
            response(post('isBlockSigner', params: params))
          end

          def get_delegations_by_validator(address)
            response(post('getDelegationsByValidator', params: [address]))
          end
        end
      end
    end
  end
end
