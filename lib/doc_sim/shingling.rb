# frozen_string_literal: true

# Shingle a document
module Shingling
  def self.shingle(document, k)
    max_index = document.length - k + 1
    max_index.times.to_set { |i| document[i...(i + k)] }
  end
end
