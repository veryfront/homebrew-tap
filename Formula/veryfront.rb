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
  version "0.1.866"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.866/veryfront-macos-arm64"
      sha256 "0c938e938d27676afe642e7e0df84f5faaeaedfcfa97857e0d888929c9b88fcb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.866/veryfront-macos-x64"
      sha256 "f50c7610a19361da7522133fcccf5af4f37e858600fe367f401cf983f80b9509"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.866/veryfront-linux-arm64"
      sha256 "d4d01ffb2a4fdef3d7c87a309357fa4af64ef9bb8e721ea978612cb28bcb5c65"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.866/veryfront-linux-x64"
      sha256 "e1f1b4b720453621462a1f7f2b3cdea634b33fa0dc3399facea99a85cf71116f"
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
