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
  version "0.1.809"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.809/veryfront-macos-arm64"
      sha256 "ff876d70ac54ec962e8a993e16147be1360559d4e111449538b69920d2177abd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.809/veryfront-macos-x64"
      sha256 "68b36bfa07fbe7edb772c1f0b5f189b7b9645f4ebc6799916f3b2f1125eb5ee1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.809/veryfront-linux-arm64"
      sha256 "9378f48cf0ba68a50814476408f3e560687a518f58a035a00fb930ce740b1dbe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.809/veryfront-linux-x64"
      sha256 "dbeefdfccea003ef1fbbcc2b2757ece1bc43c51157b2dbff3aea7b434b0e4de4"
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
