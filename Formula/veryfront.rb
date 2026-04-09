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
  version "0.1.145"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.145/veryfront-macos-arm64"
      sha256 "1ccbc98d99b7dbf90240fe2b7890e78b99faadfd0f1aa720fa2761dfe5e43638"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.145/veryfront-macos-x64"
      sha256 "caf56ec358d39cbb3c8a072c4a92cf8de1d85fe075a5b4c53df0832e3a7c2cd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.145/veryfront-linux-arm64"
      sha256 "d9c69ac1e7130620d9f4c0ec43da84a3b7f90ca2a191d2dcb03e9a85fa52bff0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.145/veryfront-linux-x64"
      sha256 "5283a65d3c94096f32e476b614d081bfecb2aa1b0750ff48dec04d29222c96e7"
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
