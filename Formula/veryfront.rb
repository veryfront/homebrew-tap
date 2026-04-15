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
  version "0.1.213"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.213/veryfront-macos-arm64"
      sha256 "557ce5a4ac87f46f0362e2062fba22e7ebc629ab76f11feaf39a40ea38be4c23"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.213/veryfront-macos-x64"
      sha256 "4c17cbe936988176d7be3bbcec537b827290f16d7df0e88be92042be495c6774"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.213/veryfront-linux-arm64"
      sha256 "069db2493a19f37c8611ea937beb61b42e971513b1056eb012feff6d50718252"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.213/veryfront-linux-x64"
      sha256 "98fe312af58fa640a214bca43fe01e3402b0de50fe4546240e85e34f60df2979"
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
