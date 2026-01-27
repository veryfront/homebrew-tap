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
  version "0.0.94"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.94/veryfront-macos-arm64"
      sha256 "05820bf550514e826367667e28849863d18883443a08b174eda4d4bc5cb036f9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.94/veryfront-macos-x64"
      sha256 "14160e86c178e0039025281f97cc461a28d8014d55bcd331c780fb8d1fdbaf64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.94/veryfront-linux-arm64"
      sha256 "81a68a3827401b005ef8e64db45e4ce54a34a53a532537869e29b242194fae58"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.94/veryfront-linux-x64"
      sha256 "5e5f22b1b21a8eded7fde81b0e67b2d1a675bfce4d487e120a1bd2d433a38e8e"
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
