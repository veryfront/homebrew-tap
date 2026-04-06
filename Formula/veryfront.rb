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
  version "0.1.138"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.138/veryfront-macos-arm64"
      sha256 "8e6108e40ce9ac9c4a9344165adbfe01eb28d3750b4aed1253468a546fa8da28"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.138/veryfront-macos-x64"
      sha256 "50e3c853907c4a57a81080b402cf522e4fa9968beb9e5c3740b1c937136cc557"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.138/veryfront-linux-arm64"
      sha256 "d55aa085c4f221995c9cd62c87ac210744d9b2f192161538bfe438393ed4f00c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.138/veryfront-linux-x64"
      sha256 "14c766b74743b2ad35ec546feffa9f7a2ddadf42891c6029ce268d437db32dd3"
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
