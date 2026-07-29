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
  version "0.1.1175"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1175/veryfront-macos-arm64"
      sha256 "aba70e7736983088e050f07e8462d425d279b849192ac53c3da94334602bab2a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1175/veryfront-macos-x64"
      sha256 "f280baeab6c480bb31701cd471c5a397b23fe6db72abb0e23efea67a8a081f31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1175/veryfront-linux-arm64"
      sha256 "4538c1ca45dc5d5a30b4988a83da980923292a6528e1a4319cfb5ef722451c17"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1175/veryfront-linux-x64"
      sha256 "70ec2c1b02e09f2aaff069adc55d2b8bad4dc217c0b7f6b74615bbb62261125f"
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
