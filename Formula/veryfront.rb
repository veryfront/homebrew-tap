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
  version "0.1.938"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.938/veryfront-macos-arm64"
      sha256 "017e7794673ab1ac75bd0ec5bcf88ff1fd2c80c39d62f89a37d88b799bf60896"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.938/veryfront-macos-x64"
      sha256 "22be129cbda475de23b2d8a6eb8444e16b95ac3c253dd5d802864135352ff0de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.938/veryfront-linux-arm64"
      sha256 "08f031d791d7dcbd9ac525945eca24c217858bc36c85809416ef47c42bcc6652"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.938/veryfront-linux-x64"
      sha256 "91f10639154ff8b29c2da389ea75a9c8493c7e2af7e2443875b05d3a34d271f6"
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
