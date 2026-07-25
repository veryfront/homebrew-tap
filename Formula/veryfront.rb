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
  version "0.1.1144"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1144/veryfront-macos-arm64"
      sha256 "92d84fba2ef5d33eb5286316166c3e5eafd77bd7c7e7dae4f503986a17b5ae3a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1144/veryfront-macos-x64"
      sha256 "d7813a9d7b089e3c4cea5e2238ebda7707922fd8d487cb0ac750cca87a90ed61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1144/veryfront-linux-arm64"
      sha256 "ecb19483c08ded3be4dce0af7c17b86c2805d99001d4162a82d795b53d8d4a76"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1144/veryfront-linux-x64"
      sha256 "c2cc0cca91fdd43d208ead6d15189403e8c8b32f7da3af9ad137941bbc255f94"
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
