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
  version "0.1.1142"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1142/veryfront-macos-arm64"
      sha256 "262ed7ebccb3b93d352fb6b330a63837f49a275577dc3053c801416d747eb63c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1142/veryfront-macos-x64"
      sha256 "66478211e1a583aac5d4e1281482ed92b29170622e607e2703a546b3e28bbf60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1142/veryfront-linux-arm64"
      sha256 "475214d7935623cedba738a7fdd37f136fd7dabc745793d84249dafe213e517d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1142/veryfront-linux-x64"
      sha256 "1e9dc9d54cf4ae98bbae2b1cdf1c8a76d21bcd4cae9b1ba839099b5f08456246"
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
