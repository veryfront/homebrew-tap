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
  version "0.1.855"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.855/veryfront-macos-arm64"
      sha256 "afcd5efb26ad0b38d47e37318bf9f8c3663edda76c0b71585759b31f284d224b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.855/veryfront-macos-x64"
      sha256 "cc6ad4b0500f4ae6f9d4d803cde9f5eae9993de8d55352867f0624e9eaed28fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.855/veryfront-linux-arm64"
      sha256 "0c33b30fa61a7adca2eb8fcf30435246d715e2ce117bfa837aa09fc51ea828da"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.855/veryfront-linux-x64"
      sha256 "726aa950eb82a9da4d4107832dc93e73ea61838b93d1b17716cd6e46cebe1288"
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
