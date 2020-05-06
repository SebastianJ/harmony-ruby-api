# frozen_string_literal: true

module Harmony
  module Api
    class Utilities
      class << self
        def hex_to_int(string)
          string.to_i(16)
        end

        def int_to_hex(int)
          "0x#{int.to_s(16)}"
        end

        def wei_to_ether(wei)
          1.0 * wei / 10**18
        end
      end
    end
  end
end
