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
  version "0.1.1094"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1094/veryfront-macos-arm64"
      sha256 "b79a2ae849130bd66c66b606b8eeca1d3cab1b8c0a37ac2e6a46c219d2a125be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1094/veryfront-macos-x64"
      sha256 "fd95176549fc42730479dcb5441b683d23312d07531800b15b9aec0115ee7a72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1094/veryfront-linux-arm64"
      sha256 "32440bfb88119db799b93f67bc6991da7cdb7f74f59362bf4b20d90549876da5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1094/veryfront-linux-x64"
      sha256 "c1ecba02e43e45943dca192888666d17c85b9f7ffb15473e1e998c776ca7950b"
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
