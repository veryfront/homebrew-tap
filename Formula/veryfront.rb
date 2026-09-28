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
  version "0.1.1266"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1266/veryfront-macos-arm64"
      sha256 "082dd9db699293d7bd37db44810f072a970b9b465fb22a88925408c18677ff09"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1266/veryfront-macos-x64"
      sha256 "7e303e62855bc2bb770497e93771286071b7f7f7d9833d638603050489660f06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1266/veryfront-linux-arm64"
      sha256 "d337b5a79ec75252aeddfd13800c2449d6fd6cd65196d37609f254353c54ffe1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1266/veryfront-linux-x64"
      sha256 "a89e2fcb0e229816e69f01cc9b3b43685a64888e321cdfd14fa4e5baef5e54f8"
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
