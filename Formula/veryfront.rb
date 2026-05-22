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
  version "0.1.576"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.576/veryfront-macos-arm64"
      sha256 "d5f43f4ff4ea5a2ba866d2cbd7812ec8ffbf19c6fc699d5eb2deb0bc409b9e21"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.576/veryfront-macos-x64"
      sha256 "d7aa585e8cd471d162b508c8ecf6c7ecd9746e28ae3e5069e96d1319fe098fa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.576/veryfront-linux-arm64"
      sha256 "fd5263583f364af7d73edea16b4165403467871b0b9eeb297bda4a99bcce39b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.576/veryfront-linux-x64"
      sha256 "346b528d679af718c7cc53bc8fd1e4edc8e574571810988c0a7a430abe9626cb"
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
