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
  version "0.1.1203"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1203/veryfront-macos-arm64"
      sha256 "8121c0c5228ec52ed52149c09e195bfbed94cc06cd83e9f70ccf8e53e72fca40"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1203/veryfront-macos-x64"
      sha256 "960c6400e2891947661db360f62e36c6c5e794597c966de1b7b36e47ff334f87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1203/veryfront-linux-arm64"
      sha256 "6d6cce2ddb09e0c4b07a2a7977af11f9ff885fafe1b4951bdd035d98eb8d11a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1203/veryfront-linux-x64"
      sha256 "e4ecad4a76e01c51a899b15ee5504015dd9f68567edeb5fa889679aa902e63ea"
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
