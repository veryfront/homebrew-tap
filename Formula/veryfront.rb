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
  version "0.1.723"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.723/veryfront-macos-arm64"
      sha256 "f219030cc02b2fa04005e94f7fa56c945b02d799f637af157523c30f0e9aa049"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.723/veryfront-macos-x64"
      sha256 "2573a934d850be96180958639884d7126257ab63cd93e757c0a36a5658371b72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.723/veryfront-linux-arm64"
      sha256 "7e2ca458beadb704cf72f1892b67729d72d4d73a94a03bae065ed8df6b3d420d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.723/veryfront-linux-x64"
      sha256 "83d520e7e05f013b33d12e6f8717b39b8818c6616d8df3ed0a3c9c44308856cb"
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
