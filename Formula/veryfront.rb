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
  version "0.1.1004"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1004/veryfront-macos-arm64"
      sha256 "de0a98da50144ec4e5159e814208010a12382460aa8b42104e78f99ea80b3c44"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1004/veryfront-macos-x64"
      sha256 "77efa89e3a68f7b66b223f34492c74c387727e384d49d226244d276e6f274015"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1004/veryfront-linux-arm64"
      sha256 "0be35f9e433ada305262dc4ade9cc1896989da0caa9a7429f33b555914594413"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1004/veryfront-linux-x64"
      sha256 "3347bf1e47eb42ffb0c6b8cdfd95c00ef5ab32cda706d017aa1e9d9fdea37bb9"
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
