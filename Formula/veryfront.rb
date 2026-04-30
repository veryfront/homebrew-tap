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
  version "0.1.328"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.328/veryfront-macos-arm64"
      sha256 "78a05dd5852828ae9ff4a9125f817a2343e03aed21166a5aef2c2f8e069b8784"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.328/veryfront-macos-x64"
      sha256 "94917f4a7c143c6e831cd628881a461d1ca13f72fc871a148b6d261dbe03e831"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.328/veryfront-linux-arm64"
      sha256 "01d5ae13da304b324b4d0262f349337a159318bb3fb283ce6c704ccc23bb6b54"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.328/veryfront-linux-x64"
      sha256 "b64561d3c1d7a6501152f7e1de653603e3c564f819af7415aca6446ce4e55811"
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
