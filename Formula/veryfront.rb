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
  version "0.1.420"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.420/veryfront-macos-arm64"
      sha256 "9fdb4af760b80ec74b0ff895307de80374b8a60ee4edba580df77b570fb3bfbe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.420/veryfront-macos-x64"
      sha256 "2c1e2896901f646846db968dec06c3b4a1a191d2b5d40ad27bc475383184e3f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.420/veryfront-linux-arm64"
      sha256 "b470a50c8e3591e8941f4ba72416c1a155cb710ba2dccd23562fc3b9424fb992"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.420/veryfront-linux-x64"
      sha256 "1533549b8c34b992ae4141662177daf7a4728c10bddad24a64a45e626d498702"
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
