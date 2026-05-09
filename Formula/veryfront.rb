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
  version "0.1.438"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.438/veryfront-macos-arm64"
      sha256 "a9f05ae0811497c2839e2f5a0d14943cbfd30c105df99f0bed386aa10fe2dad5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.438/veryfront-macos-x64"
      sha256 "d142b70d4e7fedf26c096788dc952d01de92cf719e6e2d71e582176be8b286cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.438/veryfront-linux-arm64"
      sha256 "d5c9e0af26b30db9f63f2f9726604af2bcdb995b293cf5f63c0aa6d73717139b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.438/veryfront-linux-x64"
      sha256 "94d5b391d99f7712b201a695072ae8542673b9a93bfa3acfd15aa9fbd274a5fa"
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
