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
  version "0.1.830"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.830/veryfront-macos-arm64"
      sha256 "dbbdf68586481f98dad9c856a0c8063a805c6da5a6544f011a650d516d6cd75f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.830/veryfront-macos-x64"
      sha256 "aa0c2b3b9571add732a50fb1e96560f4cb2ab63d828b47785ceed170a6ef279b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.830/veryfront-linux-arm64"
      sha256 "1360ad4d1ab63875defd3140c659674c08cd62d7087545679b5b2699eaa76197"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.830/veryfront-linux-x64"
      sha256 "b1558603ca31ce8998557315349cbd569c8639f9db5608076f48732463fa47a5"
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
