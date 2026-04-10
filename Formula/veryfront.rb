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
  version "0.1.175"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.175/veryfront-macos-arm64"
      sha256 "57648a8e337445ce6da87dee505f2fcf96a325dfe8393725825b774ef20ecd63"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.175/veryfront-macos-x64"
      sha256 "bf9a76fcb1127112858707886a565cf0691b676c2caba32bd5aad19ec0dd7237"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.175/veryfront-linux-arm64"
      sha256 "59cee07b6107bb436b7f231baf2d20d1557b6d2e04ffd84f3129a80ba44a7d75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.175/veryfront-linux-x64"
      sha256 "b236026e559d078cf10d7c648e6ef58eb1ee50705547f2e48f3988b1c2798f4f"
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
