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
  version "0.1.716"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.716/veryfront-macos-arm64"
      sha256 "2609be9ae64c287ef606836a7e23acd280a3adc75de25d107e890e2b676adb76"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.716/veryfront-macos-x64"
      sha256 "07ef60accdf442bfcbebd847a8ffb338eee69283a99c1b6e214e094d31432ec5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.716/veryfront-linux-arm64"
      sha256 "21d95acabb8cb9245d22bf526569c5c370d995fbb89599415726c724895000d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.716/veryfront-linux-x64"
      sha256 "a9f3d54566d8b485f952c3a907c2ef433c1edac35b680f6e3e4433edafe4659e"
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
