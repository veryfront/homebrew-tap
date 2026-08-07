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
  version "0.1.1210"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1210/veryfront-macos-arm64"
      sha256 "6beb8085a6d2a88824b4daa2831360eacb062226577ec9851e366ea3a3c17ea5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1210/veryfront-macos-x64"
      sha256 "345b5bf630f53e37fa6bec2ab87088f6bad267d6d51394058b816b5b3e9186fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1210/veryfront-linux-arm64"
      sha256 "39ef4ae16bbe95b680cb4f8e2c919d20bff28483825ee73e7d9ccd9afdbadada"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1210/veryfront-linux-x64"
      sha256 "13144779ad83d7f2626facb72e856bb67c5f560e078e032fec9eba07f8ba74ac"
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
