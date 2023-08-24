# frozen_string_literal: true

require "doc_sim"

RSpec.describe DocumentSimilarity do
  it "has a version number" do
    expect(DocumentSimilarity::VERSION).not_to be nil
  end

  it "identifies simple, identical sentences as similar" do
    s1 = "I am a sentence"
    s2 = "I am a sentence"
    k = 5
    r = 2
    b = 2

    lsh = LocalitySensitiveHashing::LocalitySensitiveHashing.new(r, b)
    minhash = Minhash::Minhash.new(r * b)

    sig1 = Shingling.shingle(s1, k)
    sig2 = Shingling.shingle(s2, k)

    lsh.insert(minhash.signature(sig1), 1)
    lsh.insert(minhash.signature(sig2), 2)
    expect(lsh.similar_pairs).to eq Set[[1, 2]]
  end
end
