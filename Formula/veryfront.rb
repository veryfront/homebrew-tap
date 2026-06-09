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
  version "0.1.691"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.691/veryfront-macos-arm64"
      sha256 "6d7491fa38868347fef0c9c7809d602418ef61173af1d634415ab45d606590a1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.691/veryfront-macos-x64"
      sha256 "8baef6e5e382178a7954e8c3a5208f95e99dc4ff8f1ad93badceb1336bc1ff2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.691/veryfront-linux-arm64"
      sha256 "f3d46b49fdb4d65afc85dddd448f7f96f13119d5750c1e811da05fe408371ed4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.691/veryfront-linux-x64"
      sha256 "8501edbf96c1f0b67e683697e8f28eb1980859296cda1f04924a4730d13b4b4e"
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
