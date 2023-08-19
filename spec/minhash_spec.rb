# frozen_string_literal: true

RSpec.describe Minhash::Minhash do
  context "given completely different sets" do
    doc1 = Set["abc", "def", "ghi"]
    doc2 = Set["jkl", "mno", "pqr"]

    it "hashes them into different signatures with one hash function" do
      minhash = Minhash::Minhash.new
      expect(minhash.signature(doc1)).not_to eq minhash.signature(doc2)
    end

    it "hashes them into different signatures with multiple hash functions" do
      minhash = Minhash::Minhash.new(3)
      expect(minhash.signature(doc1)).not_to eq minhash.signature(doc2)
    end
  end

  context "given identical sets" do
    doc1 = Set["abc", "def", "ghi"]
    doc2 = Set["abc", "def", "ghi"]

    it "hashes them into the same signature with one hash function" do
      minhash = Minhash::Minhash.new
      expect(minhash.signature(doc1)).to eq minhash.signature(doc2)
    end

    it "hashes them into the same signature with multiple hash functions" do
      minhash = Minhash::Minhash.new(3)
      expect(minhash.signature(doc1)).to eq minhash.signature(doc2)
    end
  end

  it "hashes slightly different sets to different signatures " \
     "when n_hash_functions == n_elems" do
    minhash = Minhash::Minhash.new(3)
    doc1 = Set["jkl", "def", "ghi"]
    doc2 = Set["jkl", "mno", "pqr"]
    expect(minhash.signature(doc1)).not_to eq minhash.signature(doc2)
  end
end
