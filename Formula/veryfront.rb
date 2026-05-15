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
  version "0.1.535"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.535/veryfront-macos-arm64"
      sha256 "4cd8344a3d88e9bc4034efeaefaa148e7e1cff80f4783ab9dfddfa5765ed651d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.535/veryfront-macos-x64"
      sha256 "603c4f589ea9519390bd818d1f359ae49e82963fdbd8c9f4390fee5f15974cfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.535/veryfront-linux-arm64"
      sha256 "743cddeebefa77d307d5b2e03a6599a40094cfd535dbfecb552a0c7a89e91f25"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.535/veryfront-linux-x64"
      sha256 "07b5f2c1e42a578ee4d09cdc62a705b949b89dd4565a1b647aada5058de4381a"
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
