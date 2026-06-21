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
  version "0.1.890"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.890/veryfront-macos-arm64"
      sha256 "b31dd5022fe9007f3edb9828d84ebc1541cd229f528fc6d8cc73200d5fa9b968"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.890/veryfront-macos-x64"
      sha256 "b291eeea83d355f1ed9abeb52c3f1e387bd369ab5cadd1785b4c948a73f7f0f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.890/veryfront-linux-arm64"
      sha256 "5184e33402c0c5b9be6f0517d8351a6cb7ecd523f049873a1ab44845117840a4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.890/veryfront-linux-x64"
      sha256 "a4b6916a532a1954584770dc54536dbb1dd445141fb64f060ef6d5d6ec9cd206"
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
