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
  version "0.1.579"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.579/veryfront-macos-arm64"
      sha256 "6b3209c73c3c4864a312edcbe09fc58250b24035150e4e6dd6316004eb589242"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.579/veryfront-macos-x64"
      sha256 "f10715147eef0647b839d021f0a7fc5d4b9306776a8836669407e44bf774cfb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.579/veryfront-linux-arm64"
      sha256 "5be9f6080614bf99fba26fd57a3afa41ff375b399fb9e34c41a2416c78c30560"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.579/veryfront-linux-x64"
      sha256 "4d28aa79828f5614339a4a52285efcd670c26583818e52e915984b7a4e5e72ce"
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
