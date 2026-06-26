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
  version "0.1.936"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.936/veryfront-macos-arm64"
      sha256 "622ed5a2c3c87e449d1fb3c648dc9cce6bfdf06fd8bdeaac4125e828324903dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.936/veryfront-macos-x64"
      sha256 "11a0cea0d023bb904d4a0cec7234fcea3e0adad06f082dd5ab88d26de83d70b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.936/veryfront-linux-arm64"
      sha256 "c575d0180cf76c308c43995c7061fae1f53bf10262a325d927411a3b4036e86e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.936/veryfront-linux-x64"
      sha256 "6361e509697619854afad42417eb23a448998eb34bc33e5255269f24d5c23865"
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
