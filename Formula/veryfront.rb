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
  version "0.1.539"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.539/veryfront-macos-arm64"
      sha256 "a4f1ed32e294ba11f44a2f078b77a24e7b72429881eff18c71bd51bbc6fe89b7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.539/veryfront-macos-x64"
      sha256 "8717c6c936fc627e1967b9c60fc6af3996ccb3c52d871c83f0cafb0e4aff075a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.539/veryfront-linux-arm64"
      sha256 "afd53dfb7e18b5b326d86c69d3a88521fb369bb84b1534c6bb8bf89929d85142"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.539/veryfront-linux-x64"
      sha256 "58af57af02995e97fa697bae6afe51af590b42617da34be17f9319fd37ba3fdf"
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
