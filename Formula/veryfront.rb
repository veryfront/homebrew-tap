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
  version "0.1.242"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.242/veryfront-macos-arm64"
      sha256 "813b95ece78ebd25f02ca0d5705e9957344269ea3ca1ad35ca143fef4d5805ba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.242/veryfront-macos-x64"
      sha256 "0bdc866286671432b2425ec87c9dbd9a90400566b6caf3bf40481fb0c851a014"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.242/veryfront-linux-arm64"
      sha256 "f98490fe9a8fcabc720010af9db48dd59df7c955bdc9b8e3bdc69399daf6f778"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.242/veryfront-linux-x64"
      sha256 "cc478a35d56d3e32c67e48bf28b3c031cce92da18bac49436b1b561551c9c16b"
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
