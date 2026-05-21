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
  version "0.1.565"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.565/veryfront-macos-arm64"
      sha256 "f8af83088872c8e5967e79a16065b66862c88d9f29d932b4b750794e09b9a4b2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.565/veryfront-macos-x64"
      sha256 "591aaf8a527832781dbfdb85f8e3a7cb67f88e3b1e4f4dd0f3d8432512db19d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.565/veryfront-linux-arm64"
      sha256 "a5db453d8cdf51dcc3cf1f3726ba75fbd6e122b2843250fc073a9de7a9895b5a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.565/veryfront-linux-x64"
      sha256 "7b0fd0d110649e40abf977ee7274aa4335fe796a1eaa6653df6bf62daa0fefb3"
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
