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
  version "0.1.1267"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1267/veryfront-macos-arm64"
      sha256 "05b6e72cd9c40a86787beaf54719e8d47aa4e7037299dc7c04fbb49be9a5a22e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1267/veryfront-macos-x64"
      sha256 "ef81f0ae9e41ea37c57ebaaa0bfeb070ea4a6cbfc8e7aaac9cdb10b37dad9d23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1267/veryfront-linux-arm64"
      sha256 "59d6117441d61a4d1314503c5ba3236d6e10b35adf8d12159a888e1dbb53e429"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1267/veryfront-linux-x64"
      sha256 "2f169528e85cc72583dbbb3f1d77d8c1701d8610ebc83cc54e627be85a00b0b4"
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
