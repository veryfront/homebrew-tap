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
  version "0.1.394"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.394/veryfront-macos-arm64"
      sha256 "8786f14d611185dab5cbd63198ebbe8206c7a625bf3bab8de0464eaacdfc2d9c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.394/veryfront-macos-x64"
      sha256 "c54015feb52c8e442ff8ffae407cd54d35ac07bd23db54b00364144aafbb276b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.394/veryfront-linux-arm64"
      sha256 "580ecdb959eb403427852a6c4de21c475b17476428e8d9eb77890766da4bea11"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.394/veryfront-linux-x64"
      sha256 "ae2ae8c35426a971ce612d3adcd4ac7014eef7ce96cd7abd51d94dec0980bffe"
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
