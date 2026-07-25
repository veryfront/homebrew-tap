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
  version "0.1.1143"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1143/veryfront-macos-arm64"
      sha256 "a59ebbc622f29e1af69e2e7cc90d68cef7f36e75810eb82b9e16895352f7402a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1143/veryfront-macos-x64"
      sha256 "40201b8107b35241b9fe8554f419cf66e0e794f558c0b757425cd39db558761a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1143/veryfront-linux-arm64"
      sha256 "794afc2ae4656e9db733022d5a5065ab9ce54bb81419325a576cca1c1126a8d4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1143/veryfront-linux-x64"
      sha256 "bc38d7aff6ac4a11ddea978db9f4902be585e89d944bc076169bd69e5c051039"
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
