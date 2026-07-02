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
  version "0.1.988"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.988/veryfront-macos-arm64"
      sha256 "7da8f258d8d3a2c943027bb59c687f2b01e9310a048a883b61d44bfbd489876c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.988/veryfront-macos-x64"
      sha256 "f3ab9083e0523f989a0eccb1867d6ee9b638f264fffa2669b1f27c64bce7b0af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.988/veryfront-linux-arm64"
      sha256 "db5260db6cf50e78169c98ea4c6878ec333fd65441c8a7f469c05730511e84fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.988/veryfront-linux-x64"
      sha256 "9853c3f220e62bd2961c3f961b538b3f11284421358a093d30fe39f4cb7aa952"
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
