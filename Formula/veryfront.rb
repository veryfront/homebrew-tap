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
  version "0.1.1103"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1103/veryfront-macos-arm64"
      sha256 "91ac8ec568dc346934651ad9299c917deb959a4b33be0edaf97bd4e7fa77326e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1103/veryfront-macos-x64"
      sha256 "3a055e95fdcda68be6290286225c2f36557703061969282610fea463cf360db0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1103/veryfront-linux-arm64"
      sha256 "3410c96a7d971b797c2ed51832aa3834fccc8d76ef428b4a4e2782a0566b25f9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1103/veryfront-linux-x64"
      sha256 "df7bcb42ffa8e8215796fb9e2456a11033e16886521f47e562a696bfadef15ba"
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
