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
  version "0.1.1198"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1198/veryfront-macos-arm64"
      sha256 "7a1b5ef463fc2c7b4fa53d3a3ae68da9299f8c14f9a312b9444952dafffd7d2b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1198/veryfront-macos-x64"
      sha256 "be31957ab9c9931c69643e7111d429094d21d6087ab441e40c6a64511243c19e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1198/veryfront-linux-arm64"
      sha256 "3b5acb40cc76cb339bef49b9abb1b6e25012af90c654e661c40584b514eacd1a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1198/veryfront-linux-x64"
      sha256 "14c29423b630b4554df37223a30e46958b4bec208f6187d33af9d6f7fee9eead"
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
