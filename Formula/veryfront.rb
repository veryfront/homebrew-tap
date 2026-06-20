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
  version "0.1.876"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.876/veryfront-macos-arm64"
      sha256 "b7ebfd16676285c65ac6e22db2fe50ec858fdc216885ffacc22f681e60ed7756"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.876/veryfront-macos-x64"
      sha256 "561e5806b1c292924943f6bcf4c08d46722899dc929ce25cef9805f323bcc373"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.876/veryfront-linux-arm64"
      sha256 "a25906119be5a33b15275891874a8289fc37200b7cde4f4cd45beeac70caeb6a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.876/veryfront-linux-x64"
      sha256 "1c5ee77d9c733a27b746a27169abd693b0128b3681080d9c5322de5dc7bb7067"
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
