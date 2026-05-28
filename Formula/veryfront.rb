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
  version "0.1.606"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.606/veryfront-macos-arm64"
      sha256 "b902ceef644d82399479e8c1e879aaba7773534e3826700779c3c4b9b4873be7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.606/veryfront-macos-x64"
      sha256 "b0313c001b9002b5a47e5030af4981389664df8a281a55db90ab95186ab20741"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.606/veryfront-linux-arm64"
      sha256 "47ccf6ae20ab2eb0454860c242cf16dc3df3581cbc5491fae78342a55a0d233e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.606/veryfront-linux-x64"
      sha256 "757f204c64bc26e3b4e3f150329ceb5d6caf9a16abf9a7649e2e8e40ced03a38"
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
