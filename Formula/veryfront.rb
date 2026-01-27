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
  version "0.0.86"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.86/veryfront-macos-arm64"
      sha256 "ab1afdaa6f7d883b3e7d480999a0656d24c6c709d88e2c13022bcb07c01b544e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.86/veryfront-macos-x64"
      sha256 "d156d53a621d25c09b9743633bf5308e3e41f66024ad9a42cd3a14b4349b0df4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.86/veryfront-linux-arm64"
      sha256 "dbdc21b8d47e5604568d65b5af640a87c507e8e9a5e97ac6d34c3f2fe53c1fa7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.86/veryfront-linux-x64"
      sha256 "e27941688f1beb91c9938f2ea562653a2e697e7003eba2fb44a7d6cc5e86e58b"
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
