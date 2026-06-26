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
  version "0.1.935"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.935/veryfront-macos-arm64"
      sha256 "7ff15a3a51f3bb478d227f6fb1cde2b8b261962d5dc4d46564640d9c376185d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.935/veryfront-macos-x64"
      sha256 "30df6a4a9b2e0077b33bbcfb6de9a64a14cb4cca17bd9d2106eda34416be54a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.935/veryfront-linux-arm64"
      sha256 "4641f6f75d53948caadc145c17b9987322217371ab12ffaf90fb2a98ebae1f75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.935/veryfront-linux-x64"
      sha256 "8906722d41a65c31825a1eac3ff733a8ed733e3bffb747cf472818f95ab07c88"
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
