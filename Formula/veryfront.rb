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
  version "0.1.1201"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1201/veryfront-macos-arm64"
      sha256 "cd771fede40425c00fef21c7c843655bf210c66c3e1d48a4bf5903f57aa5e758"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1201/veryfront-macos-x64"
      sha256 "3a4904e6bf6d509931c28f507f404530168956be4d0a07fa4d5da2e36bac1038"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1201/veryfront-linux-arm64"
      sha256 "430711c3aa17b3c0d24c36b4ccb035457466236eb9d2369f14f0a0587e963a1d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1201/veryfront-linux-x64"
      sha256 "fd5e8cfcb5af2af8788b74ceb7efae2cfb48e8ea3f6f7de4c9b8cf74ff48ac11"
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
