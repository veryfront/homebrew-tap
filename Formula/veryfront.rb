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
  version "0.1.1178"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1178/veryfront-macos-arm64"
      sha256 "8c1e3a201e6ec0560ba868b41d2e118d96a76c729ea05b4eaa39a9dc8191de31"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1178/veryfront-macos-x64"
      sha256 "3d525183a123cae1ff275a2bfc6a9ff64d07aba434af5d2ec919be31597ad035"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1178/veryfront-linux-arm64"
      sha256 "286c68106987faee6712c983bad1b23259672aeace4998f9ddd9b09b35d39cca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1178/veryfront-linux-x64"
      sha256 "8b773a2a83cc6d114726f1f326b786e2e076f97b780a7471bf81dc5378f6dff8"
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
