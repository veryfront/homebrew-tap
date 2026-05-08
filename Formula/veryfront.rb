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
  version "0.1.417"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.417/veryfront-macos-arm64"
      sha256 "2bfe882afd3c70e14cf9105b008cc305d9258d2a8cc2131b35046471c1996ea9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.417/veryfront-macos-x64"
      sha256 "977774a312459de8fe13202f3e992dc72c2df4fabf15979d5a1f333cd9875582"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.417/veryfront-linux-arm64"
      sha256 "0d127f08bb1d06b42471d9049038ce67d346950bdff77dd4fa6b80fcbad14393"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.417/veryfront-linux-x64"
      sha256 "a8e54b26d15041c1a81b6e95db2878156c9e6ead4b082dfd923f06d3ffdaaa18"
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
