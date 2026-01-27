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
  version "0.0.95"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.95/veryfront-macos-arm64"
      sha256 "69dd45e1e2fc3f2da1936c46073e95d76928dd72c07c51ac15ef4f253eff7141"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.95/veryfront-macos-x64"
      sha256 "748d6049fa14c3dc359b9624f31fb5c31da934dc695cd600865e8f2561176886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.95/veryfront-linux-arm64"
      sha256 "22c296a8bc74f99111963aad7b82586122f910f8e41dc42962fa36a5d34a2717"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.95/veryfront-linux-x64"
      sha256 "466d3af6f23cc84c3337b179804ec01457795dbc92ed46918f98780f66cd4b01"
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
