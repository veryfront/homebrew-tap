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
  version "0.1.96"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.96/veryfront-macos-arm64"
      sha256 "375bd0d8daa3013bf1007b4bd51e31f15b1bb64a4393b20ec48f662745a0e062"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.96/veryfront-macos-x64"
      sha256 "03d34d03594647e2d22d19cc465175310baae2914829f55517aaf246c06790f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.96/veryfront-linux-arm64"
      sha256 "e42d4799a3d4cea70bdb82f853a575bd83dee4afbf54b43e8bf3b614165ff872"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.96/veryfront-linux-x64"
      sha256 "e30d50082966e94926f7579471aae16d72a973b709d381f24bd769c448c4d2d9"
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
