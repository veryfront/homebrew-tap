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
  version "0.1.498"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.498/veryfront-macos-arm64"
      sha256 "bc278322b205f454b733f5dc0adce47efda39c911dd22273266484eb2435f2b0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.498/veryfront-macos-x64"
      sha256 "f1fef1181c4dbdcf0e6ec8520883064cf23316503f88031051857b5c65d48717"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.498/veryfront-linux-arm64"
      sha256 "78646d57653863146b48e010d20ebcdd597c6c1f38b2ba657c8f57e5f5e2080f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.498/veryfront-linux-x64"
      sha256 "faf61c6392f6003c0c920fda08bea258f6c8db5d5f7f609ce3a845c33d1eab99"
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
