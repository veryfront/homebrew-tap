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
  version "0.1.1136"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1136/veryfront-macos-arm64"
      sha256 "f9b819f513d1432da984a93d5bfb64ed74205449a4066da4210a35f3d60de391"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1136/veryfront-macos-x64"
      sha256 "f13dce59049cad37388fc210c8adaaed31475f2418e24cb1900477e5238e04c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1136/veryfront-linux-arm64"
      sha256 "ffb478ffeac143f91a149797d1e9c665fd2d0a6883f72669f3ce19a8b54df6cb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1136/veryfront-linux-x64"
      sha256 "4ac010441bce9c87c4d9e1c83869602a3acc6d0c1ee0528b9b960d32f17600f1"
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
