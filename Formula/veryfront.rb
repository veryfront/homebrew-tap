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
  version "0.1.615"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.615/veryfront-macos-arm64"
      sha256 "29aa1fd7e389dcea29dee6aa8bfa1cb53aca691ce981d6c3d5da84fcadf04be9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.615/veryfront-macos-x64"
      sha256 "1018cfd8554e07f033e191e5e95da0c22c439290086aa091ee08f8c4091a6aa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.615/veryfront-linux-arm64"
      sha256 "384dd0b00b95f94bfd157614616fd2a4cff5bc55c0c717f9ef323f89a716e368"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.615/veryfront-linux-x64"
      sha256 "8e5644c868befcbb324de098b510afe710a22225093ec386401025ab31346ece"
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
