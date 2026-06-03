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
  version "0.1.648"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.648/veryfront-macos-arm64"
      sha256 "425d05d26b8ce027a7d91063797fbebf67067ed2a536a8cd1c3d770ef87a12f5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.648/veryfront-macos-x64"
      sha256 "877ee223335c95f8bb845edfc5d4b43b526fab07461f18cc3b4b314633f53568"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.648/veryfront-linux-arm64"
      sha256 "8eceae688b2d2d15b270128a3b7e328ff9c2ed1d8bd269695761c2a330c8d78c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.648/veryfront-linux-x64"
      sha256 "d4d2b99a3a4eb75f5ae71dc93c9b3f16332b1b37f0fd6f877f49d57375abb1e5"
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
