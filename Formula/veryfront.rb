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
  version "0.1.1171"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1171/veryfront-macos-arm64"
      sha256 "b813d62cf05e019faeda7d1e57e9922354d969420dd76aef13e3e7136c7632db"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1171/veryfront-macos-x64"
      sha256 "5a7f865680fff010313f6424001e36b4d9453b4bd22511b5c9b2e8ba9bf4c801"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1171/veryfront-linux-arm64"
      sha256 "acba3b9b5c20217291b6312780a914ff47727482de82373052e4b229e42b10d4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1171/veryfront-linux-x64"
      sha256 "0ca77be6ad3e6e8124a998d37750309c72cd105c08c3c01f4041f73b7f58ebd1"
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
