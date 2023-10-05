# frozen_string_literal: true

RSpec.describe LocalitySensitiveHashing::LocalitySensitiveHashing do
  context "with b = 2 and r = 2" do
    it "recognizes identical signatures as the same" do
      lsh = LocalitySensitiveHashing::LocalitySensitiveHashing.new(2, 2)
      sig1 = [1, 2, 3, 4]
      sig2 = [1, 2, 3, 4]
      lsh.insert(sig1, 1)
      lsh.insert(sig2, 2)

      expect(lsh.similar_pairs).to eq Set[[1, 2]]
    end
  end
end
