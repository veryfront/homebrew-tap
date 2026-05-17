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
  version "0.1.545"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.545/veryfront-macos-arm64"
      sha256 "f5c127c401faf94ffd951a9f9e06c540bc7f4d3867c8578a7a09e462a5dad794"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.545/veryfront-macos-x64"
      sha256 "ec9fb9d5c28fb9d5d39ea786ccea01bf227347a9d950f3d44b93b679825e87bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.545/veryfront-linux-arm64"
      sha256 "aee71bae20fb7cfa7de408a28a7a90d17a0ce48f5d7f2dad4f5571296e0cdbac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.545/veryfront-linux-x64"
      sha256 "774ec7fd9ad7cb83bfe4e10831b71dcf16f4fa15722b66b853e5a872145e1e30"
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
