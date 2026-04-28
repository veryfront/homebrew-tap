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
  version "0.1.301"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.301/veryfront-macos-arm64"
      sha256 "658c4562d4eac0bae11cdead7a7cb51e6d9eb365dbe0d422c1d49d4ccca77cae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.301/veryfront-macos-x64"
      sha256 "4de6e22ba6e3b4ab248919f55c456df156b90a506588feb8e83841040ab5a094"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.301/veryfront-linux-arm64"
      sha256 "5720fa7bc06dc1126b7b1952d06f7ca1a25d84d2ec77f377f259b8af0a24ad91"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.301/veryfront-linux-x64"
      sha256 "7ef690873d69790c9bad53e41717c5042440ea8c47ae98c2763ac390fd7580e6"
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
