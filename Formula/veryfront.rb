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
  version "0.1.714"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.714/veryfront-macos-arm64"
      sha256 "e9a040dfe78ff4ecaf967d9181a68ce213cd20d71b1eb3122c2233a6c5e6ed4e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.714/veryfront-macos-x64"
      sha256 "39fc5b4b5be41cb5b030d99e005954b5e148c78076503bc4ebc7bc97790a3446"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.714/veryfront-linux-arm64"
      sha256 "59dff33995e12e21baf61ac4e11e1f930fc956cf09e98812782ae3391ea64753"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.714/veryfront-linux-x64"
      sha256 "c11e6d0bcee380be65697efbf5e926d1995313010ca0f09fac7251679daa5af3"
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
