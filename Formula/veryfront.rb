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
  version "0.1.1174"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1174/veryfront-macos-arm64"
      sha256 "d5b990b648ebe90ae5b528db7fb55f41be5425e4105514732871ee4df07a1b6f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1174/veryfront-macos-x64"
      sha256 "f70bd98c56cb1e995fe76a317922787897ea8a8ddb3d9d94df45a9863fba18f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1174/veryfront-linux-arm64"
      sha256 "f216a1db8ea8e8efd5216bf0f262fdd20854e5652c39e6617b7e8235630bc937"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1174/veryfront-linux-x64"
      sha256 "d907bc5c56af25fd10f67b31cd13a5cde696e61b643132923103377ab83a5cb8"
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
