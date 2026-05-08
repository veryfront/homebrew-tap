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
  version "0.1.428"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.428/veryfront-macos-arm64"
      sha256 "90879b0cb35822edde8981d4eb8b7d3ceb14f6fea4cbbb62b0cbdbaabfde93cd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.428/veryfront-macos-x64"
      sha256 "153adf19a959f1528391cebcae947479e9e2323699ff2ccc3ec04bb712fdb8ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.428/veryfront-linux-arm64"
      sha256 "a8f004eedce496fb3559247bc59051e352e62d949c7d3242d33b0409cee410e2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.428/veryfront-linux-x64"
      sha256 "d395198b20dba28d888794938fe6f4cfd0319570496e667f7b8501e809fbe442"
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
