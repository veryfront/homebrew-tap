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
  version "0.1.778"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.778/veryfront-macos-arm64"
      sha256 "15d5f9a012d4428fb76044e459dcdfc47e0843ed81c4fda53e4c1d1c046d8708"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.778/veryfront-macos-x64"
      sha256 "278e391e5b03f3a058ae07082c559dff34338808c65b2f91d3a68ed2aac64503"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.778/veryfront-linux-arm64"
      sha256 "949449126388b1d7660c6bd007f568d0a437018bc9b069046e0c956d37a8152f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.778/veryfront-linux-x64"
      sha256 "faa6f383f1f35fd95d9ec0ee50bfac3489bb8331023074f495c5ea0cc08eaba3"
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
