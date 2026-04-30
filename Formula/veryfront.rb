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
  version "0.1.322"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.322/veryfront-macos-arm64"
      sha256 "248469642d7e41189b9ddc9d25311ef52f9cfa3a05721a774847340a8f0c8c2e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.322/veryfront-macos-x64"
      sha256 "e63a1a2e901312ed3baef4eac04736b8153b38d6822536fd141537b3f2f2c006"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.322/veryfront-linux-arm64"
      sha256 "0e7f861e6a934e3a71cb6c4a7a595e49d4fd2c7aceb7880f67b4e0a1cab5922c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.322/veryfront-linux-x64"
      sha256 "3b53bda629c62d7aa8fda9e226b743d398548d511ecb7a6e1e1422693a28fd9a"
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
