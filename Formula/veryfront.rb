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
  version "0.1.982"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.982/veryfront-macos-arm64"
      sha256 "a82ac8032c2cbbb68c42faaaf02026d95e8282fb1fac75682a9bcfe7f0541cd9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.982/veryfront-macos-x64"
      sha256 "e2f0a254168b803cf063e18def096dd9b8ec68603de81406a9c5b9e5050f8c77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.982/veryfront-linux-arm64"
      sha256 "4ec62e833d8cbd8d2888be65d2f510a63b66e6771bab406d6c12ca45ad504048"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.982/veryfront-linux-x64"
      sha256 "69bd1f764e4a6d77816e99dc3d82c61c144ddd03a28ef4c1481642380f7c090b"
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
