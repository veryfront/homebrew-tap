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
  version "0.1.642"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.642/veryfront-macos-arm64"
      sha256 "1cc2f4d1f1067bbeb0f42a9e6e5860c81ca912b96cc7d7a713f715d30ac8bc7c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.642/veryfront-macos-x64"
      sha256 "23373c4ad5997e2928ad5f93a0a84f2924139cf81445ab0ffdaf002871c3f91c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.642/veryfront-linux-arm64"
      sha256 "dba86575002549fedf8913cbfb1581c33fde92b1673299eb3f0984c25899be18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.642/veryfront-linux-x64"
      sha256 "c65ff51a08bdf80b004d98d4444b4b6b86bbaa559f5551d4e2c378a2c49a99bc"
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
