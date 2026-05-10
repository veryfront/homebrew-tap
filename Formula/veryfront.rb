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
  version "0.1.476"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.476/veryfront-macos-arm64"
      sha256 "fbb02edb79039d5757fcc19c43af5c3a07d54c9e59f61906ad8bcae3595abf91"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.476/veryfront-macos-x64"
      sha256 "ca2cbdfced1748b92abbf336b19f5058da24e01905bc3077415667ef05a5af92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.476/veryfront-linux-arm64"
      sha256 "de25d890d57e35486c8650477fae4eaea0eb4daa7bc8cfb0ca3c6f41d6062c87"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.476/veryfront-linux-x64"
      sha256 "a111dada911d0e4a5a891631a8e30ea3787cd4eb9e309130d6ed7e62dcd78a2d"
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
