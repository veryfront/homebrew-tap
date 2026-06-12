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
  version "0.1.765"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.765/veryfront-macos-arm64"
      sha256 "a20aa9a9ac0aac932c7bed2a75c63ce017046ffcb198058502d9c9a9d787bb4c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.765/veryfront-macos-x64"
      sha256 "108a8ac3f1fb5be317c3c4c614bc0a0904630f1c98cfd41a0053ba7f363308d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.765/veryfront-linux-arm64"
      sha256 "460443bd1f27412bda03a2f879284ebb8ead04c7d68c5c043f661e044a61b38a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.765/veryfront-linux-x64"
      sha256 "0596263d680e6680445b4fd5898f809120e0896149224615a4eac66b8e9bcf75"
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
