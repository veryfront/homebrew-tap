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
  version "0.1.472"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.472/veryfront-macos-arm64"
      sha256 "5b4a31cf37ae2dff6ad84afc79435345f925af206d88962b28658e9ac7402eb7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.472/veryfront-macos-x64"
      sha256 "d626dfa872b0f48afd79d2540edbca9286f93311721840e14af97fa2199e6259"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.472/veryfront-linux-arm64"
      sha256 "2a3c349b44e6d7ee56abef5dfbf54a22fbd180240e477927236d58e7996db02f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.472/veryfront-linux-x64"
      sha256 "ad71291cc9fa3344902a6046c94a01c8685903f837fc55122c163ba3d24b0faa"
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
