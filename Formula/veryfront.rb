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
  version "0.1.960"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.960/veryfront-macos-arm64"
      sha256 "93b3e0cf8040e426fe770a006fa74f46ab2646cb5b44c9da0cd446568e407daa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.960/veryfront-macos-x64"
      sha256 "81fac6d3f108a7ffda0c0e32a0f5ab9dd4135925e3ba2332f6668fc90e4e945d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.960/veryfront-linux-arm64"
      sha256 "758b4916c0eb0c58b18f34774793fa554af36f5e04c8e9bf498338719d3d196a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.960/veryfront-linux-x64"
      sha256 "c11916ee661d28d5467a0bdf8bbb65b9528646b84a7704bc0af70bdaa2f20e4d"
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
