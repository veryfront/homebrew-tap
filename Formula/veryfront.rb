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
  version "0.1.1023"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1023/veryfront-macos-arm64"
      sha256 "f207a06bb8f7977005255fcd8b2cdef0c2d5f3134c710c54bda9440d94832165"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1023/veryfront-macos-x64"
      sha256 "fead6cf71a178e48fbe1bc029512e64158ef2a06d70d3dfda3b39d9fb2e65148"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1023/veryfront-linux-arm64"
      sha256 "f076df7d99669ac0d6d6696c41f4cf6b881de9dec47f005e15f89dcea19d6f71"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1023/veryfront-linux-x64"
      sha256 "e0376a55efc2e0521819f6c3aad08bacd406974ce83516b420058dab990d55fa"
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
