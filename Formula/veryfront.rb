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
  version "0.1.641"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.641/veryfront-macos-arm64"
      sha256 "6c8f914ce05d3ede567f9aa67487e5016882c6905e6526f33939e8e90b6fb5c2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.641/veryfront-macos-x64"
      sha256 "314b7afbf19236b16073872b9a9c77e912e495a47f3b30882ace582587017473"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.641/veryfront-linux-arm64"
      sha256 "dbb85a660dd08e5850d3810ea8cf333b51bd1afd1303243ec6890f0e67e45c2d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.641/veryfront-linux-x64"
      sha256 "dd175d565f39384598669c3114385529cfe57d3124506731b2471ce7fde531b6"
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
