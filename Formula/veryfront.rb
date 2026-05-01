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
  version "0.1.357"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.357/veryfront-macos-arm64"
      sha256 "4845a546c4f252ac7e6de43c025b774942f2a90f194df2e3a3c54aa23c7e0597"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.357/veryfront-macos-x64"
      sha256 "11497b3677e3aa54802363590503555d4a904ff58637be42ec996188af22b228"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.357/veryfront-linux-arm64"
      sha256 "22eb25ef3281bc5c51a61ed996e2a41f9119ecf292de5095706bbabfdf2ade1a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.357/veryfront-linux-x64"
      sha256 "45d1d68c8bd232176c99e97a3ff7d3b404a3bbaf50aace0772f17647b800bae1"
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
