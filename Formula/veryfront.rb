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
  version "0.1.694"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.694/veryfront-macos-arm64"
      sha256 "5ae423156fe26daba86732fe5de2eb91d0a51259aad4aa6fb00f49c2a2f9d9cc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.694/veryfront-macos-x64"
      sha256 "bc21a6bc86d9c8b73c2a2265210cc17926cc6ed68b1310ad5d4245d4198b90bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.694/veryfront-linux-arm64"
      sha256 "e6e3e12c1a5f7ffafc89cf552cb97b1ab5dc4b91104e9281925f3ffd90047bbe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.694/veryfront-linux-x64"
      sha256 "db85f00d586339fed1f65e07401086937e791e425e7b093103dc37c415631e4a"
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
