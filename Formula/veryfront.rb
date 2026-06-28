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
  version "0.1.971"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.971/veryfront-macos-arm64"
      sha256 "8d7f8c1041bbf29544b0384c460f41c7a6d6f6162390025e6a35b5a575cf22cf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.971/veryfront-macos-x64"
      sha256 "5a293afffeabc8447c18b57271d2cf6bb4d7009957def704df47f4d045ac31c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.971/veryfront-linux-arm64"
      sha256 "c65e091a24ad5baa7df814c498df2e12b95bd1ab4a78c090acdaa42c3391c701"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.971/veryfront-linux-x64"
      sha256 "87519fe036d27afbc10768eacd2b3f651db076ef67b9c8e03ab82bc7672e165e"
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
