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
  version "0.1.106"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.106/veryfront-macos-arm64"
      sha256 "97676f85cfb9906b94ae0464b77a7af568d6fefa29f31ad601539a9685ffac4d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.106/veryfront-macos-x64"
      sha256 "42271adf56652f2b1742cf2dc34f15a49486193a2f388b38822436b3e7f80ae9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.106/veryfront-linux-arm64"
      sha256 "35d5d906a376074aae065489191d321d8e66dd9536f37e5c0adacb9e82de9ad1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.106/veryfront-linux-x64"
      sha256 "a26724d61994ccf7795668c8a68eb58fedaafa357670ee9ac87ab1f02ded9714"
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
