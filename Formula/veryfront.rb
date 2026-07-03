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
  version "0.1.998"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.998/veryfront-macos-arm64"
      sha256 "3e8b6251819983d7d2977647ea857aff80a4b5826e5417408f509dd0d0948732"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.998/veryfront-macos-x64"
      sha256 "067af65cb4db32cac106bf0fd87c09d710f2d38d2cc717e90170b0f72b86f5f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.998/veryfront-linux-arm64"
      sha256 "49a56db1f4f9a73c60185388c6a2d21dbee017a435e9b7b2d8ab19808ad0a15f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.998/veryfront-linux-x64"
      sha256 "46bcf52d41e4d61b8b4b76318bc733e7a4dbb1a017211ca547deda545d66ddb0"
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
