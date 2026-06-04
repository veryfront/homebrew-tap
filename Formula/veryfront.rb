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
  version "0.1.657"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.657/veryfront-macos-arm64"
      sha256 "05677fb47cd68029fb77e2819e37f61bab900bf68fa19e12dc2f9c4e8dbc8933"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.657/veryfront-macos-x64"
      sha256 "312574bfff969878b09da1a6df74b9d0d1c7e96d43b520d6ccc1010be1617af3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.657/veryfront-linux-arm64"
      sha256 "04623dfae1aaa45c9db01228096803a26fbd5213fb5eebc86d091f066afc95ac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.657/veryfront-linux-x64"
      sha256 "30e94d71f5a5920f851a05651423b97e87758f562ebaf9bfaed0e987b82d0902"
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
