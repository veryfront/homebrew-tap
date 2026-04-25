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
  version "0.1.270"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.270/veryfront-macos-arm64"
      sha256 "1a5e09f8fe3d7c2b078a45151657d999e393fec3261811b47851d7c920eed0b5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.270/veryfront-macos-x64"
      sha256 "ece6634b565e55069df40528c31c05b25a4596a6c3cf340c863592f52dcff883"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.270/veryfront-linux-arm64"
      sha256 "b5430ab864a1e3fbf80cf6ba48406cfd7a9375650a6305b02ae326e5daa5e692"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.270/veryfront-linux-x64"
      sha256 "3b37dddd783ee240ad605f57d229a8cc87eaeb1f62f4ee77b13756dc28b68fa5"
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
