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
  version "0.1.916"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.916/veryfront-macos-arm64"
      sha256 "34f34af001f07870b75f69b5f7428bb6f586eb42d1fa1559c107515a0be44f02"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.916/veryfront-macos-x64"
      sha256 "ee89b93a86ca0003162e85bde1e2966dbc21d755ddbdc8fd07449e38eb0b5713"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.916/veryfront-linux-arm64"
      sha256 "4f63c30e5fece9dcc0f68662e1db0621eb8f7201057cd38636cb5a06d929ff54"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.916/veryfront-linux-x64"
      sha256 "2d8d533b6a3732773b8e4d973764653189dc894d59e285248bbf15116fe76300"
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
