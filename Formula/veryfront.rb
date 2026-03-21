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
  version "0.1.79"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.79/veryfront-macos-arm64"
      sha256 "dd92acb2ec508bb22c647b447cd4ee97b103419a892f1ed89d65a396ee617c3f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.79/veryfront-macos-x64"
      sha256 "4b3e2b111c157d79a58734890de50c1baf5821da7fd750c9a606f849b0305adf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.79/veryfront-linux-arm64"
      sha256 "68cca548e590b680b2e8bd2ddb6f6a6c2ad866d6af7f0a8a64a9107c61d4107d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.79/veryfront-linux-x64"
      sha256 "145bda51e0c38c50bd20a96bac5cbc802dadd0e6c2148982d79896c5cfa68fc0"
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
