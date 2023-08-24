# frozen_string_literal: true

# For brevity, "o" indicates match, "x" indicates mismatch

RSpec.describe LocalitySensitiveHashing::LocalitySensitiveHashing do
  context "with b = 2 and r = 2" do
    it "recognizes identical signatures as similar" do
      lsh = LocalitySensitiveHashing::LocalitySensitiveHashing.new(2, 2)
      sig1 = [1, 2, 3, 4]
      sig2 = [1, 2, 3, 4]
      lsh.insert(sig1, 1)
      lsh.insert(sig2, 2)

      expect(lsh.similar_pairs).to eq Set[[1, 2]]
    end

    it "recognizes completely different signatures as not similar" do
      lsh = LocalitySensitiveHashing::LocalitySensitiveHashing.new(2, 2)
      sig1 = [1, 2, 3, 4]
      sig2 = [5, 6, 7, 8]
      lsh.insert(sig1, 1)
      lsh.insert(sig2, 2)

      expect(lsh.similar_pairs).to eq Set.new
    end

    it "recognizes ooxx as similar" do
      lsh = LocalitySensitiveHashing::LocalitySensitiveHashing.new(2, 2)
      sig1 = [1, 2, 3, 4]
      sig2 = [1, 2, 7, 8]
      lsh.insert(sig1, 1)
      lsh.insert(sig2, 2)

      expect(lsh.similar_pairs).to eq Set[[1, 2]]
    end

    it "recognizes xxoo as similar" do
      lsh = LocalitySensitiveHashing::LocalitySensitiveHashing.new(2, 2)
      sig1 = [1, 2, 3, 4]
      sig2 = [5, 6, 3, 4]
      lsh.insert(sig1, 1)
      lsh.insert(sig2, 2)

      expect(lsh.similar_pairs).to eq Set[[1, 2]]
    end

    it "recognizes xoxo as not similar" do
      lsh = LocalitySensitiveHashing::LocalitySensitiveHashing.new(2, 2)
      sig1 = [1, 2, 3, 4]
      sig2 = [5, 2, 6, 4]
      lsh.insert(sig1, 1)
      lsh.insert(sig2, 2)

      expect(lsh.similar_pairs).to eq Set.new
    end
  end
end
