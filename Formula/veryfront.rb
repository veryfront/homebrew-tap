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
  version "0.1.1240"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1240/veryfront-macos-arm64"
      sha256 "db304f815da364ef7e0e39dacb5f382321d7b23d1ce0b7cd382391963288e626"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1240/veryfront-macos-x64"
      sha256 "4fd8e769e52412012b590d7453ad61f7c161640c3c62cf4fd46f0769b0f48d81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1240/veryfront-linux-arm64"
      sha256 "31d51dc2fa5cc262d205eda04e8aeccb1fcef98b5a0addfc128d266359fcf9c7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1240/veryfront-linux-x64"
      sha256 "f6b4117d3eaa62cce800cca6cc6bfe992bd34be4846f90c12ac4ea7de38ed785"
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
