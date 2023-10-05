# frozen_string_literal: true

# Shingle a document
module Shingling
  def self.each_shingle(document, k)
    max_index = document.length - k + 1

    if block_given?
      max_index.times do |i|
        yield(document[i...(i + k)])
      end
    else
      max_index.times.to_set { |i| document[i...(i + k)] }
    end
  end
end
