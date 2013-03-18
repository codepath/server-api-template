# This extends Hashie::Mash so that Hashie can interpret Arrays and Strings, instead
# of just hashes.  We use this in the assertions for json responses

require 'hashie/mash'

module Hashie
  class Mash
    # Hashie::Mash.construct([]) => []
    # Hashie::Mash.construct({ :foo => "bar" }) => <Hashie::Mash ...>
    def self.construct(hashable)
      if hashable.is_a?(String)
        hashable
      elsif hashable.respond_to?(:each_pair)
        self.new(hashable)
      elsif hashable.respond_to?(:each)
        hashable.map { |i| self.construct(i) }
      elsif hashable.nil?
        nil
      end
    end
  end
end