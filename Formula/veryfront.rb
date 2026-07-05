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
  version "0.1.1017"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1017/veryfront-macos-arm64"
      sha256 "092cbadd6f84ffe4e20c552ebb29b5a1116a2579eaaa1c9563f01ffc206ba9f0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1017/veryfront-macos-x64"
      sha256 "1e787aeb9878904501470de6ba23b82c1dd1b0f1c642be7dbc7cf1712b718c0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1017/veryfront-linux-arm64"
      sha256 "39f6cbed99aa9752a4c8cb2e2e98ea1f7df7c33e206209ec2bd151ae8f0e34ce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1017/veryfront-linux-x64"
      sha256 "341dad7839f18b110ea7cb01fa9e332fe0883d86f50ac9f16ad3ceaa7aa75b0d"
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
