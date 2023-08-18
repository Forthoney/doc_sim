# frozen_string_literal: true

require "document_similarity"

RSpec.describe DocumentSimilarity do
  it "has a version number" do
    expect(DocumentSimilarity::VERSION).not_to be nil
  end
end

RSpec.describe Minhash::Minhash do
  it "hashes different sets to different signatures" do
    minhash = Minhash::Minhash.new
    doc1 = Set["abc", "def", "ghi"]
    doc2 = Set["jkl", "mno", "pqr"]
    expect(minhash.signature(doc1)).not_to eq minhash.signature(doc2)
  end

  it "hashes identical sets to the same signature" do
    minhash = Minhash::Minhash.new
    doc1 = Set["abc", "def", "ghi"]
    doc2 = Set["abc", "def", "ghi"]
    expect(minhash.signature(doc1)).to eq minhash.signature(doc2)
  end
end
