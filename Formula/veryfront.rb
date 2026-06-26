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
  version "0.1.939"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.939/veryfront-macos-arm64"
      sha256 "1bc69d97f67f79c8b91a98895850108a4fe798e22ac0303f0c619da5a25da874"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.939/veryfront-macos-x64"
      sha256 "5103722c8c5c3995eee64645d86592eb285dd9df9ee0b457dc121ccfa81775da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.939/veryfront-linux-arm64"
      sha256 "9a92d80aeedf8a714411b89f13a8ab833c8be7bacc6673f1cbf32135ed699de2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.939/veryfront-linux-x64"
      sha256 "ead9b943cb24b596aeb58d93972239b57e20f261aeedfeb2d3e3267f687db75e"
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
