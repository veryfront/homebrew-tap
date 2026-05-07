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
  version "0.1.406"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.406/veryfront-macos-arm64"
      sha256 "85be259e1940a09909b9dde886daf45cc43ae9e3d117d12e273f7ba9f6a669eb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.406/veryfront-macos-x64"
      sha256 "5aa361da4f0213c417bf8ef94176b7d6ff2a1712b1c15ad6fcf87f1014b93abe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.406/veryfront-linux-arm64"
      sha256 "1472c8c2aeeeb1fdcfb541cbae72176ee932da62b9c9a3eab49d8d27f3491cdd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.406/veryfront-linux-x64"
      sha256 "31a7f09e0f3b1647a27d2f0fa03f037788f95da6f49208e94dce4e56ea7c8726"
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
