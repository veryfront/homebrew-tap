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
  version "0.1.900"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.900/veryfront-macos-arm64"
      sha256 "c7748795e19d128cdab73f8b6b424633a96f371d4000d957f7796bce0f8dd8a0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.900/veryfront-macos-x64"
      sha256 "7ffa97f9bc25abbec784467415d3f14024dadcee6d321c4213e0295dfd30cddf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.900/veryfront-linux-arm64"
      sha256 "0614134f1547fa8753ab76e48f368a1c6e81daa7f9dc9445bd785cb653ca356a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.900/veryfront-linux-x64"
      sha256 "0a0265898ba1ca8b4f68d4029e8a44f956562360b71276608d46b3fe7d1db088"
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
