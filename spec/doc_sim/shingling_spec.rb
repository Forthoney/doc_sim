# frozen_string_literal: true

RSpec.describe Shingling do
  context "given a string with no spaces" do
    doc = "abcdefghijk"
    it "shingles with k = 5" do
      shingles = Shingling.each_shingle(doc, 5).to_a
      expect(shingles).to eq %w[
        abcde
        bcdef
        cdefg
        defgh
        efghi
        fghij
        ghijk
      ]
    end

    it "shingles with k = 6" do
      shingles = Shingling.each_shingle(doc, 6).to_a
      expect(shingles).to eq %w[
        abcdef
        bcdefg
        cdefgh
        defghi
        efghij
        fghijk
      ]
    end

    it "shingles with k = 1" do
      shingles = Shingling.each_shingle(doc, 1).to_a
      expect(shingles).to eq %w[
        a
        b
        c
        d
        e
        f
        g
        h
        i
        j
        k
      ]
    end
  end

  context "given a short sentence" do
    doc = "I'm short."
    it "shingles with k = 5" do
      shingles = Shingling.each_shingle(doc, 5).to_a
      expect(shingles).to eq [
        "I'm s",
        "'m sh",
        "m sho",
        " shor",
        "short",
        "hort."
      ]
    end
  end
end
