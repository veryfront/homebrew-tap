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
  version "0.1.857"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.857/veryfront-macos-arm64"
      sha256 "491ef85056cdd7b2a75593536fa448bf2e670e2356d153a5206274764c35faa9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.857/veryfront-macos-x64"
      sha256 "fdc04a772ddfb3d0f57e9753ba314f43ca0900090b27d078ebcc8632185e16c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.857/veryfront-linux-arm64"
      sha256 "8719ca3cc2b518e1c782aeb2dc2aff463f6f635dd8268c471009f2cd2a3f8bb9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.857/veryfront-linux-x64"
      sha256 "3fed9b5f4ea480a62ae1ee15b16d9a75b09d7f709b09040998cd00467b07d095"
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
