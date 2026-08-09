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
  version "0.1.1220"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1220/veryfront-macos-arm64"
      sha256 "038a88112515174b4ffbca3145fb4788abd65a6a973805404f7665bb0d379cd8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1220/veryfront-macos-x64"
      sha256 "bcfa43305c1e8ba1404ff2700cea255d237f6855140f650329f2463e935534b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1220/veryfront-linux-arm64"
      sha256 "5876893665c7e6470533dc3b94f338c2967719e43e0c15fe750307c0e4b8ddf8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1220/veryfront-linux-x64"
      sha256 "4c211779401a311b72587ced43ae24d361a3979b0afddc48ef64b8aebdf07133"
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
