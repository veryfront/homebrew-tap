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
  version "0.1.345"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.345/veryfront-macos-arm64"
      sha256 "aead261164726c086e9682bfcaa2126883f03af488d91929daac4a819999f99b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.345/veryfront-macos-x64"
      sha256 "1442ba24f8ffdffd5819b1425ed64faf1648cbae94fbaf2a0d96e53b1946b377"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.345/veryfront-linux-arm64"
      sha256 "4d6f40889eab65a4b2cee5cc02af7b4bfa60e60176b7e363f03fa6e9779408ad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.345/veryfront-linux-x64"
      sha256 "eea13ed995db2545ab5160603127394b7a2c80ec01f21f65ea91515a490e4b90"
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
