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
  version "0.1.411"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.411/veryfront-macos-arm64"
      sha256 "bf3036dc6ef040dfdd7c8b9927aba79fc0de14828e1f5e1486a4b4b5161b0eaf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.411/veryfront-macos-x64"
      sha256 "86be313ef3040bca9c903aafdae158a38ae8dc200b9ecf749e2719878588c509"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.411/veryfront-linux-arm64"
      sha256 "89490909bedc4ea3f2018bc4a15acb40f3580aff23e7fff7efa0470212cdf3e5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.411/veryfront-linux-x64"
      sha256 "8e5a1ebfae88a7160cd7d87fe91c09c7bd5213464434c0dec2b86dc8350eeddd"
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
