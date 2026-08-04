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
  version "0.1.1196"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1196/veryfront-macos-arm64"
      sha256 "fd3fcea486d756433bde8c903ba6469c55a78e1f6f9d99e6ad1a8a4ba60bcde9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1196/veryfront-macos-x64"
      sha256 "848c2e64a0f3c0a84f93a4da3b47c807762f09f9fa7393c83773eed5b50d8f8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1196/veryfront-linux-arm64"
      sha256 "ad4f6d553dd4f37f298fac85f0ab34b342077736e24e7e370cb480446257bffd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1196/veryfront-linux-x64"
      sha256 "07f42d2b7e998087fd6cebabf5bc4014f08dd2cab2780568b96443aafa8107fe"
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
