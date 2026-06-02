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
  version "0.1.633"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.633/veryfront-macos-arm64"
      sha256 "e78f904e2960e667db77af4dfa4e63d6f29c4089b759cb3157dd37d2fdd73219"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.633/veryfront-macos-x64"
      sha256 "ed11d5c961129423e70f7fccfa90f21608be66bfa1bf67b54f17bf7bd816d8e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.633/veryfront-linux-arm64"
      sha256 "6498dead416f614efba3bbe033784407c73ab251d8c5ec37bf414295f175e847"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.633/veryfront-linux-x64"
      sha256 "456407adfdf3c7e08a3bcd3690a6ff243df35139bd36b761d57515ab275584d3"
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
