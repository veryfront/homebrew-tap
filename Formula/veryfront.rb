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
  version "0.1.690"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.690/veryfront-macos-arm64"
      sha256 "98c8e4efe8b2f18295e8ceeaf84c6999598284dbc6d7aa656d4bae458ade8b58"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.690/veryfront-macos-x64"
      sha256 "32f17083dc036ab03b88dd21e3a856c718166ee27e34b0e936da3fe45179154f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.690/veryfront-linux-arm64"
      sha256 "d85a6ba08f2ad6f477ba068f0c8683b4e780a316b5abd5631e6f063f00a1e90d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.690/veryfront-linux-x64"
      sha256 "21541a7e64ec2751683df666b8ca0d88a0bc76171d919ab3786b1ee5eea4e709"
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
