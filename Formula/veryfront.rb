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
  version "0.1.1146"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1146/veryfront-macos-arm64"
      sha256 "c696dccde6f08b1adbb30482b70a71d9348391136c268eff842da651a53a4e1f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1146/veryfront-macos-x64"
      sha256 "52a818cbf8aae9212ebae3fece2e53e9a5b3ac46cf7c2c0d2c2bc337312d8e01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1146/veryfront-linux-arm64"
      sha256 "942e3ba0e94a46257a935caf49b51a2a2802a8834440668cb6340e46b4200d71"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1146/veryfront-linux-x64"
      sha256 "e74257a3192ed4f3553cc8cabd45c27f6992e9df9b82068ab37a1e02984e8a3d"
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
