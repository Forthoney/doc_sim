# frozen_string_literal: true

RSpec.describe Shingling do
  context "given a string with no spaces" do
    document = "abcdefghijk"
    it "shingles with k = 5" do
      doc = Shingling::ShingledDocument.new(document, 5)
      expect(doc.each).to eq %w[
        abcde
        bcdef
        cdefg
        defgh
        efghi
        fghij
        ghijk
      ].to_set
    end

    it "shingles with k = 6" do
      doc = Shingling::ShingledDocument.new(document, 6)
      expect(doc.each).to eq %w[
        abcdef
        bcdefg
        cdefgh
        defghi
        efghij
        fghijk
      ].to_set
    end

    it "shingles with k = 1" do
      doc = Shingling::ShingledDocument.new(document, 1)
      expect(doc.each).to eq %w[
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
      ].to_set
    end
  end

  context "given a short sentence" do
    document = "I'm short."
    it "shingles with k = 5" do
      doc = Shingling::ShingledDocument.new(document, 5)
      expect(doc.each).to eq [
        "I'm s",
        "'m sh",
        "m sho",
        " shor",
        "short",
        "hort."
      ].to_set
    end
  end
end
