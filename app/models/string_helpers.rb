module Helpers
  # A little class to help with handling strings
  class StringHelpers
    def self.random_string(length = 8)
      rand(36**length).to_s(36)
    end
  end
end
