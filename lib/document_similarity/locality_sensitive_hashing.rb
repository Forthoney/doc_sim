# frozen_string_literal: true

module LocalitySensitiveHashing
  # Hashing technique which groups similar objects together
  class LocalitySensitiveHashing
    def initialize(n_rows, n_bands)
      @buckets = Array.new(n_bands) { generate_band_bucket }
      @n_rows = n_rows
    end

    def insert(signature, doc_id)
      if signature.length != @n_rows * @buckets.length
        raise(ArgumentError, "signature length does not match n_rows and n_bands")
      end

      signature.each_slice(@n_rows).with_index do |band_signature, band_idx|
        @buckets[band_idx][band_signature] << doc_id
      end
    end

    def similar_pairs
      similar = Set.new
      @buckets.each do |band_bucket|
        band_bucket.each_value do |bucket|
          similar.merge(bucket.combination(2))
        end
      end
      similar
    end

    private

    def generate_band_bucket
      Hash.new { |table, key| table[key] = [] }
    end
  end
end
