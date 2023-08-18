# frozen_string_literal: true

require "locality_sensitive_hashing"

RSpec.describe LocalitySensitiveHashing do
  it "has a version number" do
    expect(LocalitySensitiveHashing::VERSION).not_to be nil
  end
end
