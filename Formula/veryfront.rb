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
  version "0.1.1074"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1074/veryfront-macos-arm64"
      sha256 "e58010aa715d0ccd2a974739440be9a6f121334b05736e577265655c50d41d31"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1074/veryfront-macos-x64"
      sha256 "af9c2728dc3732432404e53ae057a42575dbf624373b2606f806a02ba6dd1faa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1074/veryfront-linux-arm64"
      sha256 "18a186d58485d84f52c38869f9d1799f2777d9c1fc8c1c46219fdf797e39ae36"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1074/veryfront-linux-x64"
      sha256 "9fd0ba5c4236df980733001bb28a8d06efdf989167a6e0a519a95b1842695f3b"
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
