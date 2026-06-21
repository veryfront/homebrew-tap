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
  version "0.1.884"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.884/veryfront-macos-arm64"
      sha256 "86888fe1f3ee0c41c58ebc385c65b27262e21b5599228e0d3d470c838aa697cb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.884/veryfront-macos-x64"
      sha256 "e832db66a5dd88dfc0de489f5377c2571af61797016154cb511adcd99efc18ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.884/veryfront-linux-arm64"
      sha256 "784850057a2f53da7a4d9ec4b4e5b076d5a47f70cd2d547a172742ab4d4f5c3f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.884/veryfront-linux-x64"
      sha256 "74e45ed397914d4715ec334480eebbe7bb1091dc5b3c5a3f976ca110b08d3aa3"
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
