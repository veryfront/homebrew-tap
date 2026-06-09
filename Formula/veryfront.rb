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
  version "0.1.724"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.724/veryfront-macos-arm64"
      sha256 "8c893d6ba792f38626ad8b9b81f33d56e50b1de36f845f67962128ea8d8dc530"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.724/veryfront-macos-x64"
      sha256 "a0c0e0642f75f6b564460952448ed40ba6c0e4a41773a5e1cf0a5f6c409f2779"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.724/veryfront-linux-arm64"
      sha256 "b468fd209fcf25b8d7ce6ab99750e771cd7606f49bfdf674c384f863d6150f2e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.724/veryfront-linux-x64"
      sha256 "c5a59a862c4fe85b12172a173d06ab029443eb460959ae48ef4e4564c8b43f10"
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
