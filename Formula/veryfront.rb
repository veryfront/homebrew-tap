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
  version "0.1.435"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.435/veryfront-macos-arm64"
      sha256 "d087bce3c96d0fb48657a4b2b819df5d096528654d6a5a546e861dd6b755ab9d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.435/veryfront-macos-x64"
      sha256 "c1e4d83b3c5d1b3d9e05e9a17bc2c8400559dfcbd90c2f53b2555e17163e202f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.435/veryfront-linux-arm64"
      sha256 "aa4ca16f468eda242a1452f5c5eda878b4ee78c3715c12935bf2ba3cdcd235c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.435/veryfront-linux-x64"
      sha256 "5bd896c121638095286e60f1d3347e88fbec215f2ce3e177d84560a7e85ab30e"
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
