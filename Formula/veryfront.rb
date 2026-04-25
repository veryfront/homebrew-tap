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
  version "0.1.269"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.269/veryfront-macos-arm64"
      sha256 "4cc8ad0319559ac57549b7b48c4536d8f93694c5eb5657917bcb182a70e634b5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.269/veryfront-macos-x64"
      sha256 "d5bc704ca11173bc1b0afc9d1fd99b9f206d47bae1940386f696d0ffc53ff25d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.269/veryfront-linux-arm64"
      sha256 "9c7631781277d605e09442403b783fbf803593c2b82cb6866220c82e4e72666b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.269/veryfront-linux-x64"
      sha256 "886bf3d2b6c34a376dd2fa1d262330fec662f01ec5d03ceae8069e1d3a747da0"
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
