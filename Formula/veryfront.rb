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
  version "0.1.506"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.506/veryfront-macos-arm64"
      sha256 "8afbc6e907509e1d88a9628f0fcb4e9d1ca23ff641ddbc92b28dc2794da6f639"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.506/veryfront-macos-x64"
      sha256 "9e3c847426a449f2381ad3c72cc284db7256e5dfdbf245a3e78f11826c7bec21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.506/veryfront-linux-arm64"
      sha256 "5ae7911b651b147221fea56230c38c2ba5a8c7f6682f3eec1891b18bdd15ad0d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.506/veryfront-linux-x64"
      sha256 "d68666806b01df603be570fa29a7d360853bf4da50157f3fa75c5dc1fe2bb502"
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
