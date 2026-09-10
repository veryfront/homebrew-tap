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
  version "0.1.1258"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1258/veryfront-macos-arm64"
      sha256 "5bf1bb372c7baa9ad35c4fbde9185ff15d4749aecdd5423a703aee98098fdfe1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1258/veryfront-macos-x64"
      sha256 "ba23d712901a918c1a20268d31cbd5703ed651bc7192c3501b3a0d22a71ee2fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1258/veryfront-linux-arm64"
      sha256 "85e01f5399741a40955fbc7a7beb1c29869a4c200fa6a6838a2b9bfb03bb7eec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1258/veryfront-linux-x64"
      sha256 "3963ae31bf92a53e3f93077f704ba9806afe0761e9185fe9d68d08053cfc5ed0"
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
