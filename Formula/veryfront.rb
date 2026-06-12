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
  version "0.1.764"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.764/veryfront-macos-arm64"
      sha256 "9588dee20add6518db657c79458dd80d77927f055e242a5718600b29208ec963"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.764/veryfront-macos-x64"
      sha256 "b5a4e1fb88f37ced8f4009be55dd2d8888c5d9d3e4318588ebe43464c079fa1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.764/veryfront-linux-arm64"
      sha256 "dde82cbc8df8c8dd23f107dd2d394af7d08af575a02f1b33181c6473ed5b9533"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.764/veryfront-linux-x64"
      sha256 "e48b98ececf7c2cfbf456416ed7742fd6dcfa91493ac2398303f6e2d9989889c"
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
