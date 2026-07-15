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
  version "0.1.1068"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1068/veryfront-macos-arm64"
      sha256 "817a172e6861b4dc4bfc551252eefbd63b88a19a9e824e011f2c502fb520da12"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1068/veryfront-macos-x64"
      sha256 "c6ad628f1293eb36d0ae249460e12f6cee288499a22803b974f9db62173bf0ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1068/veryfront-linux-arm64"
      sha256 "de02da233107cd7206f9b427323d29a1403e64e60dcfdb16e4c722a5ee3e4971"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1068/veryfront-linux-x64"
      sha256 "db417a7c13634e8a205a4d50d12d05adae2162c52618871a529850fd3cb655c6"
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
