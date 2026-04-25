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
  version "0.1.271"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.271/veryfront-macos-arm64"
      sha256 "a884d5cba83586aff536dbc3b39bae808e64192ac3990e25bdef488bdce71d2a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.271/veryfront-macos-x64"
      sha256 "1571767c186f309c6348cdd4ad22beb90ef765a2abffa19e9db96bdea423a685"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.271/veryfront-linux-arm64"
      sha256 "32d8ce5dd7b2ec93e94444f93c8b0a11fae130b4ee16d14216bdc62843d9cbd6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.271/veryfront-linux-x64"
      sha256 "c67123099fcfd2edb74720c2461f8ac15e7f8f8abc9080ccf3a3606cb08f2c19"
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
