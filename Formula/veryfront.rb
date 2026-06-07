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
  version "0.1.683"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.683/veryfront-macos-arm64"
      sha256 "c5732d3c5e0733ca5f72915876f4d550ad4a8fcb936bc83f498d48e329b03094"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.683/veryfront-macos-x64"
      sha256 "a0953eac6ca07a86bf6352a6783d9cbbaff0add4898ebedf96827b04ecf7b572"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.683/veryfront-linux-arm64"
      sha256 "75745ebb9d87bfd7cc957b4876b5764197b2dedd9f9a6c6d8847cdd4c5198002"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.683/veryfront-linux-x64"
      sha256 "90c8ce12acdd03ba746aecdba471cab599e71e91a4b10e61ab18c4af6a7029a9"
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
