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
  version "0.1.482"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.482/veryfront-macos-arm64"
      sha256 "50ebff354b4f71e7492dd050839f6207bd9fe9f6ebe61febaefa66c1b04afc52"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.482/veryfront-macos-x64"
      sha256 "d8a6e43f2ebf7fdb2d2d8ac8d04e924455aa8be41aba78120429f93bfdd101ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.482/veryfront-linux-arm64"
      sha256 "68180820f1129fedf44af6df58c1a8069095d8d34cca627b026c5267dccbded0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.482/veryfront-linux-x64"
      sha256 "343c3053ef5b1a59364ddd99de317105e492d41c392c82e42fde0593b61725b4"
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
