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
  version "0.0.111"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.111/veryfront-macos-arm64"
      sha256 "f319f8502bf561b54cf2b1b22d8766c240b5d1db98da5261990018a6cc8a961c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.111/veryfront-macos-x64"
      sha256 "79801166feaa4f17369cb232658f231aca304a3f2b21f3d08148cad1d1a953a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.111/veryfront-linux-arm64"
      sha256 "81db4bb9bc834a9760cec18733b705d45fea0a7223a6b4a4fa5dbf17ba05ccf8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.111/veryfront-linux-x64"
      sha256 "0c9cb091d330d76317b207d526f73a2aef0431e64f2a9e693d30088bc0336739"
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
