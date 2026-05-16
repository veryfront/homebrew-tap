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
  version "0.1.538"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.538/veryfront-macos-arm64"
      sha256 "b2e3b8316151f8cfee3cacbb13a0961e5cca02ec14462e8fb55c7c0b7c4eca11"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.538/veryfront-macos-x64"
      sha256 "1e836c54b5b721374262973d4b5dafae28fab6de596598cb5637bd397e65750a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.538/veryfront-linux-arm64"
      sha256 "bcea946863d940a12194ee4bc0331f5e898f08075219ff4730ef55cad5c095b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.538/veryfront-linux-x64"
      sha256 "876e30abdc5cf39eebb9e3df6911e4f0a05f9ed739635f0f8f6e9c0608b54a30"
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
