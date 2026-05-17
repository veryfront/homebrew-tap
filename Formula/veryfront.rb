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
  version "0.1.547"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.547/veryfront-macos-arm64"
      sha256 "7b67c1a2a78e0c58522573cf320429dafc9bfb9257ad7acd70dd4bf2f8184646"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.547/veryfront-macos-x64"
      sha256 "065896b6da3e80d078472645f69fc0ac8bfe6745f2b237fe521402b997bb49ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.547/veryfront-linux-arm64"
      sha256 "e7130b047cae7eb8edbd2c2fcfa103c5ca11c77b78a9f66361121267b2697791"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.547/veryfront-linux-x64"
      sha256 "6ba006e35a9984f9a62414474261473cf3ca04f9fad80f712b0fec36a48df815"
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
