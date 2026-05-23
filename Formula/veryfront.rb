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
  version "0.1.588"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.588/veryfront-macos-arm64"
      sha256 "7eaea35bd087c054ec979bc9b3e911a2cbfb5091878f5b7ec1d38bb170e6a635"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.588/veryfront-macos-x64"
      sha256 "dbd3d67a0258d2ccdd48bf0eac1df89e8440df37dee62b594248543e3f604dc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.588/veryfront-linux-arm64"
      sha256 "67b6adebfde478b0d23086420e78606b04ce306fc59a751c18c54b0f8b87914b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.588/veryfront-linux-x64"
      sha256 "0608b799cddd76f260275742610584abbf9e47753859cdd09c5c6b0380bb4fe3"
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
