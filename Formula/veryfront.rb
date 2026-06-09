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
  version "0.1.728"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.728/veryfront-macos-arm64"
      sha256 "4513ede597bd52ae50435ac5e9b678a03b927cb91c9104dbbfdf73c181debc4d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.728/veryfront-macos-x64"
      sha256 "d9ad124a59429d9836c1a36c365d15ca879e752a1f45e88911c1e200ff153451"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.728/veryfront-linux-arm64"
      sha256 "e191cf2fe0d6c7214c99563d750087f5bbed6041c0705817c21c18c0a0efb719"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.728/veryfront-linux-x64"
      sha256 "2ed40ade1c74efd5b3607acc189887b3591b8bff4bdee5394eeee235cff80dc7"
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
