# frozen_string_literal: true

module Harmony
  module Api
    class Configuration
      attr_accessor :networks, :faraday, :verbose

      def initialize
        self.networks = {
          mainnet: {
            shards: 4,
            url: 'https://api.s%d.t.hmny.io'
          },
          testnet: {
            shards: 3,
            url: 'https://api.s%d.lrtn.hmny.io'
          },
          tnet: {
            shards: 2,
            url: 'https://api.s%d.tn.hmny.io'
          },
          os: {
            shards: 4,
            url: 'https://api.s%d.os.hmny.io'
          },
          ps: {
            shards: 2,
            url: 'https://api.s%d.ps.hmny.io'
          },
          stn: {
            shards: 2,
            url: 'https://api.s%d.stn.hmny.io'
          },
          pga: {
            shards: 2,
            url: 'https://api.s%d.pga.hmny.io'
          }
        }

        self.faraday = {
          adapter: :net_http,
          timeout: 120,
          open_timeout: 60
        }

        self.verbose = false
      end
    end
  end
end
