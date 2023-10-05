# frozen_string_literal: true

# Shingle a document
module Shingling
  class ShingledDocument
    def initialize(document, k)
      @document = document
      @k = k
    end

    def each
      if block_given?
        max_index.times do |i|
          yield(@document[i...(i + @k)])
        end
      else
        max_index.times.to_set { |i| @document[i...(i + @k)] }
      end
    end

    private

    def max_index
      @document.length - @k + 1
    end
  end
end
