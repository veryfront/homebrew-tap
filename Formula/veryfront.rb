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
  version "0.1.1257"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1257/veryfront-macos-arm64"
      sha256 "a4747731d6c327f210d821a50914a0bfda1d238030c448c556e050a921bec7b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1257/veryfront-macos-x64"
      sha256 "1c9d6824f32fffde6a11168eb1a16f81f6f9a655e8e63b4d1407e3de4d2edd55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1257/veryfront-linux-arm64"
      sha256 "691dfde84803494cba698e5326c79e80b9b42126eb7547ef1c5ae3207d45ce1f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1257/veryfront-linux-x64"
      sha256 "8b316d685d80596ea1c4bdec4993cffb392406d885a94ae759ec7cba0086fa56"
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
