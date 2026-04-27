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
  version "0.1.281"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.281/veryfront-macos-arm64"
      sha256 "bce522adb053a691295780ecc049a00025e78172f7dc0ce968b51aba89f70c6c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.281/veryfront-macos-x64"
      sha256 "4d3c2123907cc9dade83cd4f19272fbd42659c0c37347b2695146ded4a92abc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.281/veryfront-linux-arm64"
      sha256 "30927509acadf700fe7fcfe7727c67ee8cbbc8eeac0821ea80b73652acf4d691"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.281/veryfront-linux-x64"
      sha256 "41c1f5a8c493e54f9c4f3bf035a3bfc79d3a5233296e52d781d6a2272384b727"
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
