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
  version "0.1.959"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.959/veryfront-macos-arm64"
      sha256 "5099c07e47596107f484eb2d1ad42a80b7d09fdc6b290c0fe007d712276ad236"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.959/veryfront-macos-x64"
      sha256 "29870b5e7b0a36fd5316a5f155caa15278adade8d254bef855c94f7ddfe31843"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.959/veryfront-linux-arm64"
      sha256 "0cb9601d33b82c47a82f1268d2456c819b7c0056960d45974e71a73c259e769d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.959/veryfront-linux-x64"
      sha256 "a3968984e7fe21a0d92756e7993d00c23100c2fb1083536eac65f0b7299af6c4"
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
