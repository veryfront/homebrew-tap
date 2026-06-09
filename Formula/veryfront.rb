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
  version "0.1.733"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.733/veryfront-macos-arm64"
      sha256 "3b5f305ff14901414d0213346a1b2500258ea569a25d91649e8892e92371a1c9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.733/veryfront-macos-x64"
      sha256 "5bbfdf7a26da7c759c71ada8f46f080e60b5db6c49f61a32ac4911fee9a45481"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.733/veryfront-linux-arm64"
      sha256 "91ed685a83955314ae434f49de3b273813bac3882364a7069ec26a8b6aaf2532"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.733/veryfront-linux-x64"
      sha256 "ad032914eee1fe83ce8b5b94239610070b21fe8890d8ceaa5950d60306dfecc4"
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
