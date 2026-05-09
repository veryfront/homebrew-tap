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
  version "0.1.459"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.459/veryfront-macos-arm64"
      sha256 "721c7c939e707de722e1972e1170ac0394f74ea90fea7f9505e6585b95f0915d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.459/veryfront-macos-x64"
      sha256 "a4771d2f085ed1911ca006cd442130a30aa8377c9627e3bae8c44641cac6f8b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.459/veryfront-linux-arm64"
      sha256 "3147d01e64217dfa0d17a7231966a1a9b2100711e9233d5accf9ba4308549a61"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.459/veryfront-linux-x64"
      sha256 "3ac9ae32674a734cb622fd6fdac0c003d584b31a5479244cb3d3ad9cfef277e7"
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
