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
  version "0.1.583"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.583/veryfront-macos-arm64"
      sha256 "a4a698400c5e5eddecd4a4e81c3287abfaed6b756e0e58bfd252c8b4fed05b36"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.583/veryfront-macos-x64"
      sha256 "07c253263039a5fe1cb4249b1ed94e8e5f034b8c9b04232513d79b9d2187f9a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.583/veryfront-linux-arm64"
      sha256 "30984684a97dde7690653afbe1b13841877597a721faa53489026e85bc785fe4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.583/veryfront-linux-x64"
      sha256 "076d230406926a95b42cd72da956a39a0cf6767267b738465bcdde16000748b7"
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
