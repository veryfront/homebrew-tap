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
  version "0.1.192"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.192/veryfront-macos-arm64"
      sha256 "8a59df7bbb936c59dea3441d43cca949e41c1ca1bb7e26351e2323e15fb9a596"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.192/veryfront-macos-x64"
      sha256 "0e373f87b1b570c65eac0959a3f20ff7d21c6ab60cf05dcd59563a3f79d47410"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.192/veryfront-linux-arm64"
      sha256 "389915ce50c258f071c3ce020497dcae3f1662e1a4e44bd31399d830389a0683"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.192/veryfront-linux-x64"
      sha256 "9451e1e892dd7cd8d7d1c3591253728364d129911bf2926720c12e74ff2c8ed8"
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
