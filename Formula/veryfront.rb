# Homebrew formula for Veryfront CLI
#
# To use this formula:
#   1. Create a tap: veryfront/homebrew-tap
#   2. Copy this file to: homebrew-tap/Formula/veryfront.rb
#   3. Users can then: brew install veryfront/tap/veryfront
#
# Or submit to homebrew-core for: brew install veryfront

class Veryfront < Formula
  desc "Zero-config React meta-framework for AI-native applications"
  homepage "https://veryfront.com"
  license "MIT"
  version "0.1.182"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.182/veryfront-macos-arm64"
      sha256 "2730ecb43d09c082b9106329db89e642ab988a62d0bcaad7bd8dc400487c4c5c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.182/veryfront-macos-x64"
      sha256 "69c283ff10491b3a5be3fd0682401f47875adff418d18dc31a1ce3cf0f377422"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.182/veryfront-linux-arm64"
      sha256 "5d48c10a7158932fe2fbcf31678378ca753746d8e0179fc2480ad8a1d879dafc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.182/veryfront-linux-x64"
      sha256 "d39a9b63606188289ee9c3a80549d8af0754990d7042faced1487f846553342d"
    end
  end

  def install
    binary_name = "veryfront"
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "veryfront-macos-arm64" : "veryfront-macos-x64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "veryfront-linux-arm64" : "veryfront-linux-x64"
    end

    # The downloaded file is already the binary
    bin.install Dir["veryfront*"].first => "veryfront"
  end

  test do
    assert_match "veryfront", shell_output("#{bin}/veryfront --version")
  end
end
