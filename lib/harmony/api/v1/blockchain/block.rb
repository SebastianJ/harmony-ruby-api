# frozen_string_literal: true

module Harmony
  module Api
    module V1
      module Blockchain
        module Block
          def get_block_by_number(block_number, full_txs: false)
            params = [Harmony::Api::Utilities.int_to_hex(block_number), full_txs]
            response(post('getBlockByNumber', params: params))
          end

          def get_block_by_hash(block_hash, full_txs: false)
            params = [block_hash, full_txs]
            response(post('getBlockByHash', params: params))
          end

          def get_blocks(start_block, end_block, with_signers: true, full_txs: false)
            params = [
              Harmony::Api::Utilities.int_to_hex(start_block),
              Harmony::Api::Utilities.int_to_hex(end_block),
              {
                'withSigners' => with_signers,
                'fullTx' => full_txs
              }
            ]

            response(post('getBlocks', params: params))
          end

          def get_block_transaction_count_by_hash(block_hash)
            response(post('getBlockTransactionCountByHash', params: [block_hash]))&.to_i(16)
          end

          def get_block_transaction_count_by_number(block_number)
            params = [Harmony::Api::Utilities.int_to_hex(block_number)]
            response(post('getBlockTransactionCountByNumber', params: params))&.to_i(16)
          end

          def latest_header
            response(post('latestHeader'))
          end

          def block_number
            response(post('blockNumber'))&.to_i(16)
          end

          def get_block_signers(block_number:)
            params = [Harmony::Api::Utilities.int_to_hex(block_number)]
            response(post('getBlockSigners', params: params))
          end
        end
      end
    end
  end
end
