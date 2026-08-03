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
  version "0.1.1190"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1190/veryfront-macos-arm64"
      sha256 "9b516cc7b19ebb53255d7a7b5f596e6ba28dc0c989a8e3e42ff843074ab80e0c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1190/veryfront-macos-x64"
      sha256 "c216de3c2a11b507c65f1a4c6dcebb3016637745b37bde926eb2d89f7fbe1d1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1190/veryfront-linux-arm64"
      sha256 "d32fd27b1a0a1e6b442fd2c1d7a7fa02a2140c4a2061aba82e78bcd52b387046"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1190/veryfront-linux-x64"
      sha256 "cbccc5d581a66d411d56e5fc40317ec0d8be441c06bb32d4351036f240a64ba9"
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
