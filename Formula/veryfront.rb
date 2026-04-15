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
  version "0.1.215"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.215/veryfront-macos-arm64"
      sha256 "9260694514f955ffff093b36df80efca12596a716bc8117918aa46ddf38c56d4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.215/veryfront-macos-x64"
      sha256 "41c7e2329f7b62e53ab1f6bfe85944e24a854bedf6f84e4e13d161abb775cd2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.215/veryfront-linux-arm64"
      sha256 "f92b900ec9ce3e17f17772414aaa1071fde42e0658180e892ef012abced21dea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.215/veryfront-linux-x64"
      sha256 "e9d5ea800e5522c918ddaa40b3f8f02ab2528851b61aab76a3619178d5157465"
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
