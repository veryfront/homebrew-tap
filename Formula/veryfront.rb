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
  version "0.1.515"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.515/veryfront-macos-arm64"
      sha256 "470562f04f06ec5cfc444d66a57c735d995413a320768c23e58ddeb7e24aad22"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.515/veryfront-macos-x64"
      sha256 "80b19a5b71b110ef7b682ebc3c644a174cf101288f81cb59d6167ee42ab2385a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.515/veryfront-linux-arm64"
      sha256 "dfd4b19a873198f35467006364b42e1b7ab3a9508b868c1885ddd1fe2f84cdb7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.515/veryfront-linux-x64"
      sha256 "45903339becec6f4bcf52abb043a1c7deb9c9ceb14be08dfcec107f0593b827a"
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
