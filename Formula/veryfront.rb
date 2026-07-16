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
  version "0.1.1073"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1073/veryfront-macos-arm64"
      sha256 "39c0aec20ba4506aedfd3903f1c5677c38c31aa4191b136e041d2968d03fea59"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1073/veryfront-macos-x64"
      sha256 "7dc3163a42df05722f955e0fcec31640d7439babdc5fdcb7e4b2e39ec64b9711"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1073/veryfront-linux-arm64"
      sha256 "a49151bf20584f0ec04532eb25922b4441af5f86407b041f4a380703c216926e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1073/veryfront-linux-x64"
      sha256 "875db210f102bc54acb6d2a0a9704347105eaa5aa015b1959ee646d7380141f5"
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
