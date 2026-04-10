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
  version "0.1.164"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.164/veryfront-macos-arm64"
      sha256 "881f4e838e7360b6df40d53b869e08cc486c2da31e1a71bb7b1dae62e2a19072"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.164/veryfront-macos-x64"
      sha256 "78f1168fe8912ba0841bc3cec3313b9d3af4c7d080ef128e84685bc2242a66de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.164/veryfront-linux-arm64"
      sha256 "497fe9bfcccaafa110d52f300373975e852605c366a93be233fd15aa0275be78"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.164/veryfront-linux-x64"
      sha256 "83b67a520ee4cb8dd3f23d1fe44ebac1e9e052e804ef35d6047050a38260af90"
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
