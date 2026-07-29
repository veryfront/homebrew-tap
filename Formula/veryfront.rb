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
  version "0.1.1177"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1177/veryfront-macos-arm64"
      sha256 "b3c196aa4b72407d84e1d4ecece414d06d59c567dd005da12b95f6e443457aa0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1177/veryfront-macos-x64"
      sha256 "3eb613e1b3b981fc16c48da126b6fd35aeaf58618dddaf26af4cc3e59677c5dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1177/veryfront-linux-arm64"
      sha256 "3db8abf9f5418bfb89a72600e3a11e2b84e99439c94403373463df50c0a4b9b5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1177/veryfront-linux-x64"
      sha256 "b8a54ad3518f8ea78d494456cea62aeb7a948dd3ffad4bb9b898bbdd34d79eed"
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
