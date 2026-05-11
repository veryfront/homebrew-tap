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
  version "0.1.479"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.479/veryfront-macos-arm64"
      sha256 "1838ea774297bdf85d5cfde4b3acd0cc9434f37e97d8ee1ef3cd06604c29de3e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.479/veryfront-macos-x64"
      sha256 "ee0cad16a670d11da9e57a755ef7a17931f1268a2e87d480e81574d68c1ebbdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.479/veryfront-linux-arm64"
      sha256 "760e099db1ecef02618feae47ff81f0a0fd18151b503fbefea5bb0b5aac0deba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.479/veryfront-linux-x64"
      sha256 "caa27e3bb09c2e2fa5a21c197a51c150fa448f2bca50677d4323169268c4ed04"
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
