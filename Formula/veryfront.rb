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
  version "0.1.171"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.171/veryfront-macos-arm64"
      sha256 "42e913c85b25391505bb2466d8f07eadb0e27e2dcdc33667090643b945f023d7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.171/veryfront-macos-x64"
      sha256 "d392d3382b7a37d30fc36188529b05a7a1408336d2a83a8bc7b83cd3c64329c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.171/veryfront-linux-arm64"
      sha256 "62fe0b7e8e1d41c1c874dfa38cc9dfbd1b2ef0e1fac60a9e2ae954a892aa8843"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.171/veryfront-linux-x64"
      sha256 "b547e5317991492f8d56589317a48fcd614b4133b1b87f9da35c697e054295d8"
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
