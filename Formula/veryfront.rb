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
  version "0.1.155"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.155/veryfront-macos-arm64"
      sha256 "eb833be3157c63b91d41923ed812b8b1f165fe49a3197331b5efc098ee5e7350"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.155/veryfront-macos-x64"
      sha256 "e55f1e51a9f1af67d4f8a97e69ff207b892d3cd0c15e0dbbf191527888354d0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.155/veryfront-linux-arm64"
      sha256 "5a4fb823258bbd78e9d41f8c4ce4e54e27d8ee202f2f50aaa359a1b575bba20b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.155/veryfront-linux-x64"
      sha256 "db58cf4bb0924e699da29a92fcd7199f753cf7de202726d3603d69d483017a09"
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
