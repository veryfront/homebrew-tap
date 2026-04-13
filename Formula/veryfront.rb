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
  version "0.1.196"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.196/veryfront-macos-arm64"
      sha256 "464a9fff8adf495bbaedb9f51d61f7f2e7961cd4af023177965490f78257a323"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.196/veryfront-macos-x64"
      sha256 "34fa3c4403c2ab87e3c9dafeea8de3ae5700debcf0fff83c5651db82011c390a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.196/veryfront-linux-arm64"
      sha256 "850648502375f38a94f6ad25aaccf928fa5cdb557502cb5e994ebc647eddd6c3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.196/veryfront-linux-x64"
      sha256 "6c8e3664b22ce194be2b3e13a3ee19fa24ea07f916d2b2bb77377683f5c4f123"
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
