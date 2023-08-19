# frozen_string_literal: true

module Shingling
  def self.shingle(document, k)
    max_index = document.length - k + 1
    max_index.times.map do |i|
      document[i...(i + k)]
    end
  end
end
