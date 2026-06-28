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
  version "0.1.963"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.963/veryfront-macos-arm64"
      sha256 "ac506cd0c8c5d18978c2730b4355cea091f9930f98ebbb88b92f0226603cfe89"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.963/veryfront-macos-x64"
      sha256 "78187a06fed3740abcb50abaeba0f44c4ca281133f7710537d9786a477b770ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.963/veryfront-linux-arm64"
      sha256 "229de082815bdc54724be453718f2c5640919d6cdf9c7f8681b0bee587f31b02"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.963/veryfront-linux-x64"
      sha256 "e2532f98882065cd755e509799f0dbf11bff511b0e72f0eefbf76976067f0e0b"
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
