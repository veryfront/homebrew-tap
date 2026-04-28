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
  version "0.1.298"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.298/veryfront-macos-arm64"
      sha256 "24f9d5a3bdbd80a724090d6d918329f1db3ef2ed8dac7363b6fbbf7fa205cf25"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.298/veryfront-macos-x64"
      sha256 "7830fac94b262874a545e9af756fcfabc90d129a9b9e00d52b7802cc2880f3ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.298/veryfront-linux-arm64"
      sha256 "54928ab01e8a0c511d0ff83c4488a10a47ac8434a20fb5845baef112339180e8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.298/veryfront-linux-x64"
      sha256 "fa5cb7e64d09c34cc8440f03a18231f562e125829b0673b3059e8ca1171a8eba"
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
