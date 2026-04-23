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
  version "0.1.262"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.262/veryfront-macos-arm64"
      sha256 "411fe2b3b29e33251b38c2824e2e01a56bdfaa44c54403b37fbd6d03f905654d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.262/veryfront-macos-x64"
      sha256 "07909e8194cf11bd9623f49fa934fa139f5914bb60dad14d02822af3fbfc537b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.262/veryfront-linux-arm64"
      sha256 "dba789cca14b8f4e39cf80be082decae26ea568c414f2dacbee6c25a74c3a913"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.262/veryfront-linux-x64"
      sha256 "eacfd88e9f4bd3d47c27594a8a05d2664a009e9bd237b5995228f6e5e5b15c77"
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
