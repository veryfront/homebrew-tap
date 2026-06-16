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
  version "0.1.829"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.829/veryfront-macos-arm64"
      sha256 "471b93d4a89cb454ef59864e05051c5ebb4c3733b133441e3ab540ae64553098"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.829/veryfront-macos-x64"
      sha256 "6500ac85d2448d1ead8fa40f7452d7945f848c62f614057d0a0a6e5c2a04517b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.829/veryfront-linux-arm64"
      sha256 "9bbca1f312b4a05e9b8bc9dcba9233cf21d40e00c7049ae32ca4641a7ba657e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.829/veryfront-linux-x64"
      sha256 "3dd827029f324f69a3308333071743574bbdc50cd94f5d4ff505345fd07e2c54"
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
