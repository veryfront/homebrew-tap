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
  version "0.1.1123"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1123/veryfront-macos-arm64"
      sha256 "0e88c4e9346567aa4a77c1f5126e6f891ec01fd4ab28b57bc046f494fac103df"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1123/veryfront-macos-x64"
      sha256 "b121d4ca14ffcb36ebdbb4e089e8d03813a1b323579b35e2613435336fe5f093"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1123/veryfront-linux-arm64"
      sha256 "b9877f4ddd6c99dfa9c27b83d6462866800dbcda728ca70313fa56baaab7c40f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1123/veryfront-linux-x64"
      sha256 "eb57dc7c943ad24e59410de3a942e295ad4ada894310787bad2ea353afdbeca7"
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
