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
  version "0.1.793"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.793/veryfront-macos-arm64"
      sha256 "b9f98500a1d781e1655ba7b3d0e538eceb7fe76b4bc497dfb67128c1027fac34"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.793/veryfront-macos-x64"
      sha256 "ca0ca744e21ba1d686ca9566e4dcebef45d212116fc411bc03c78750340e7781"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.793/veryfront-linux-arm64"
      sha256 "f318f63b2dd9e941cdd3482e9a4e3869f85e72577b7ec802007523b85a6c0fbc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.793/veryfront-linux-x64"
      sha256 "b84194a3fb2f1a2421e692f009e8751f572feaa582ab03cd4e05aa910a7e286b"
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
