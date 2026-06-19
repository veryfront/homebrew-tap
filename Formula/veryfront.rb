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
  version "0.1.859"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.859/veryfront-macos-arm64"
      sha256 "cd34a7c35913e7e6ffe9593480b76b3019bdf2f412221c45afe506b391bca012"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.859/veryfront-macos-x64"
      sha256 "f5915ada476fd5c95076a02efff426659a9e0c264fd1e6e396a9ebe3aa81db51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.859/veryfront-linux-arm64"
      sha256 "f10ef8ec28f2af664afdc1366d9eb68f36c38d2fec251b069c10f33c745d6b77"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.859/veryfront-linux-x64"
      sha256 "ad095306f36523550e2e76d0036485c839c15d298139c35f59e7264ec80be0af"
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
