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
  version "0.1.725"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.725/veryfront-macos-arm64"
      sha256 "8452f53cfb8a3e7e64a7417b0a842ea080128e6d29509614118fc77550f1b328"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.725/veryfront-macos-x64"
      sha256 "c8748ad701186ebce1e3e9a02562f062504cb6b6905fcab1bdd124f54ffe4181"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.725/veryfront-linux-arm64"
      sha256 "0eebb57d376475e538f37a6caa127c8e265bdd02e5162da6e646e17cdc3b5369"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.725/veryfront-linux-x64"
      sha256 "760c8ff2fd97e3b003f75674df21541a7438710c135fca4914d9f872bcc90b90"
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
