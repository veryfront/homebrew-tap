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
  version "0.1.141"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.141/veryfront-macos-arm64"
      sha256 "eaeaf781e8417f3611837b1f4738cc83f38116f74bf2d3e6abbc3e235e48e29d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.141/veryfront-macos-x64"
      sha256 "1f7d3f95630f50086396dbe1c02a20a002e58262fbc88c1e90f6181b3f979668"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.141/veryfront-linux-arm64"
      sha256 "551c75ce55dc83f06f64bc06ffa8ed254bddbf4f00f6952aebe0755cf5d1d914"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.141/veryfront-linux-x64"
      sha256 "66819cdfa465b7138ed01fbfe18e1d30bfe87f7784c4d9324dcfaff89cfed790"
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
