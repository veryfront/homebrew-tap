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
  version "0.1.264"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.264/veryfront-macos-arm64"
      sha256 "6df4028b0488b56941b5eaeafce0a7824eea3898f91fcde1bee2b06a734aa95e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.264/veryfront-macos-x64"
      sha256 "c69b9f6e1fbbf11f66d56fa5cfd4699ce28c2db69e20092dcd3498f04ca021a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.264/veryfront-linux-arm64"
      sha256 "2da7c37730fb987963c56a849c70e325d812370793b5a8543a8e147cdcb7a75d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.264/veryfront-linux-x64"
      sha256 "4366bce26ecdf5175068c498c1d48d89e42841fc10442d92bdfa6fab98a4e114"
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
