# frozen_string_literal: true

require_relative "document_similarity/version"
require "document_similarity/minhash"
require "document_similarity/locality_sensitive_hashing"
require "document_similarity/shingling"

module DocumentSimilarity
  class Error < StandardError; end
  # Your code goes here...
end
