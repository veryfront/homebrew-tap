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
  version "0.1.289"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.289/veryfront-macos-arm64"
      sha256 "9373815ff04cd40d73c37b9cefbf8eb2285061601abda22004f7be0a548f0c42"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.289/veryfront-macos-x64"
      sha256 "0d8419ab045601a0f52ff9c51e2369146ed782d0ba3e868910276cc7c7fc68db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.289/veryfront-linux-arm64"
      sha256 "b51d7238851e9b67fe31418c46471c23633a4b9175f55473068aa43867664e2f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.289/veryfront-linux-x64"
      sha256 "5ee717a5e7986a8222c76c21b8d36fac890909d9b6541a7cbe192614f3b52f31"
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
