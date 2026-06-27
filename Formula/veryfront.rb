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
  version "0.1.950"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.950/veryfront-macos-arm64"
      sha256 "cd3a2902f8802c4ad8e47f147a95a90a5e35271f295ba3a0a370f6abb01c6d8c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.950/veryfront-macos-x64"
      sha256 "a018fdfdbef8bd9151fb1864c7e9759844a901415f3cb9c86dc1a30525aae369"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.950/veryfront-linux-arm64"
      sha256 "c2bcc4234500ccaeba8aa98a672481bc2e43112ce21f2158baa3c712e647e9cc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.950/veryfront-linux-x64"
      sha256 "fcc6130b5940dfbe6ccc3a24b7334fc36c56ff8c20600c7072ab39f1ba166cc8"
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
