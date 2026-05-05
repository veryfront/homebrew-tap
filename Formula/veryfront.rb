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
  version "0.1.392"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.392/veryfront-macos-arm64"
      sha256 "13f42d5043071101c605a6b520f551be07fae40b2ee58311696ddc6c2bdb4792"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.392/veryfront-macos-x64"
      sha256 "d768d7ef371a8a440e8e097ac08ef840e7e63fe228b88c062327b78280e1c2e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.392/veryfront-linux-arm64"
      sha256 "a1cafb6d38dff02419cb2888decb712d53da947ff5895f273fa7de6f7a304098"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.392/veryfront-linux-x64"
      sha256 "51364e19d1e6f8e1e2ea674598cf08f9f376a4d07766528295a558433960e37c"
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
