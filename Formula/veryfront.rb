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
  version "0.1.784"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.784/veryfront-macos-arm64"
      sha256 "3bd40f635af544e488b0653bf437f00789d608181e0b18e8a5fca363bfde5354"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.784/veryfront-macos-x64"
      sha256 "9505bf3acd0a6358e47ecda411d26395f4f786ae8e53f76c1c9b3c6dc8ab213f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.784/veryfront-linux-arm64"
      sha256 "f6ae8211eed7c2073b01eb1294e21492c4e1cad5073eeca69695718e6b7256d7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.784/veryfront-linux-x64"
      sha256 "f8f29a15edb3bf8f94143fbb645b6f9163b47620aedac97ca7228886d6728860"
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
