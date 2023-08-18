# frozen_string_literal: true

require "murmurhash3"

module Minhash
  # Class for generating Minhash signature
  class Minhash
    attr_reader :seed_root

    def initialize(n_hashes = 1, seed_root = rand(2**32))
      @seed_root = seed_root
      @hashes = Array.new(n_hashes) do |seed|
        ->(x) { MurmurHash3::V32.str_hash(x, seed_root + seed) }
      end
    end

    # Produces the Minhash signature for a given Set
    #
    # @param set [Set] the set to produce the signature for
    #
    # @return [Array[Integer]] 32 bit integer array of length n_hashes
    def signature(set)
      counter = Array.new(@hashes.length, Float::INFINITY)
      set.each do |elem|
        @hashes.each_with_index do |hash_func, i|
          counter[i] = [counter[i], hash_func.call(elem)].min
        end
      end
      counter
    end
  end
end
