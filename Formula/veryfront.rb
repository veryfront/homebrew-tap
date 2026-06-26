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
  version "0.1.943"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.943/veryfront-macos-arm64"
      sha256 "8f5a91cf27a1c83a1b84bb19673a94ab56b447bc9b5e80cc649e13a325e8113b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.943/veryfront-macos-x64"
      sha256 "598f0a66cdbc0a9e038f89313d1ac259b44dc5572937f911bd7e200197a4d73b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.943/veryfront-linux-arm64"
      sha256 "c6487050415c276471daef0af6bb34321fcfe1ae8fda16babaf3390a55e485e5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.943/veryfront-linux-x64"
      sha256 "4e19f9b6414692ad75260be028c81ed76cbb786ec855b70ee8de86bd2a984a49"
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
