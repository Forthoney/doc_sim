# frozen_string_literal: true

require "murmurhash3"

module Minhash
  # Class for generating Minhash signature
  class Minhash
    attr_reader :seed_root

    # Hashes will always be <= 2**32
    HASH_MAX = (2**32) + 1

    def initialize(n_hashes = 1, seed_root = rand(2**32))
      @seed_root = seed_root
      @hashes = Array.new(n_hashes) do |seed|
        ->(x) { MurmurHash3::V32.str_hash(x, seed_root + seed) }
      end
    end

    # Produces the Minhash signature for a given Set
    #
    # @params [Enumerable[String]] the elements
    #
    # @return [Array[Integer]] 32 bit integer array of length n_hashes
    def signature(elems)
      counter = Array.new(@hashes.length, Float::INFINITY)
      elems.each do |el|
        @hashes.each_with_index do |hash_func, i|
          counter[i] = [counter[i], hash_func.call(el)].min
        end
      end
      counter
    end
  end
end
