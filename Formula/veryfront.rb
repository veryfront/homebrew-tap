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
  version "0.1.129"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.129/veryfront-macos-arm64"
      sha256 "1617b3ed8a3a7282fffc70c3f3ba0e5d2505df301b4e69472984234fa2a4945b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.129/veryfront-macos-x64"
      sha256 "ffba13aacb203bbc848ffba59e86211858be7a85616cceb88f8f50b7709492d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.129/veryfront-linux-arm64"
      sha256 "bf86f933b296f1c8587faa418da29669b0a3a7c0c002fa5e7e8abffca82c8101"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.129/veryfront-linux-x64"
      sha256 "0e785722d396ab41516218ea243da6322bacb5dc6071e7d21166ca30cff21c8c"
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
