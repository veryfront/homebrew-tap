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
  version "0.1.903"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.903/veryfront-macos-arm64"
      sha256 "9b15244f0e3cb4e447ed861d67c3b96e26d2ef82188cec00e090772cb45c2f9b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.903/veryfront-macos-x64"
      sha256 "d3037d60fbcd95003674d624eaedf4714cfb7b8f93ad15bcc2e90f29fe1a263c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.903/veryfront-linux-arm64"
      sha256 "7b4fddc52ea92e949af13f7e63cee0aff103c5cd3e2abeecb0534999e3079027"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.903/veryfront-linux-x64"
      sha256 "d4314fa8462190f5f684d9a1c0fdaae667d17fa8248590a1d55892b0bcb71b9f"
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
