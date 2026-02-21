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
  version "0.1.20"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.20/veryfront-macos-arm64"
      sha256 "791c3e7afb9d1313b6a078a9a958eab1d969c1f176f2df873a0eb59f44075f18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.20/veryfront-macos-x64"
      sha256 "e8af0859cb8046eecef8a29f0a70bef9e1ac39308037a2845269b95a80c75a49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.20/veryfront-linux-arm64"
      sha256 "2314e9f3963f556dc547a9f86d541f67dd09388d878654cafbeaeb556ae7d751"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.20/veryfront-linux-x64"
      sha256 "8bded9d1a1201ea8f42e3a0d8b118c4349010ad5f293c6e6c6086fbb172d8026"
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
