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
  version "0.1.453"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.453/veryfront-macos-arm64"
      sha256 "6fca5b56647b2205e755e7225c3c789b103c171499d46493518ca64520816170"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.453/veryfront-macos-x64"
      sha256 "99171403f9c23942e85d4124330e33ce1f11bc763200eeefa5fcceadb7fe5844"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.453/veryfront-linux-arm64"
      sha256 "1c83355120c794a5cdd82068d3f4ba223223e9a746f8ab5e4d7356c372cc18df"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.453/veryfront-linux-x64"
      sha256 "c269fc342a5889dd735016b2dfc549486e815a3aaafac53a5fb74e247bedd5d6"
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
