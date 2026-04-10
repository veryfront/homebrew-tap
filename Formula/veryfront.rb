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
  version "0.1.161"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.161/veryfront-macos-arm64"
      sha256 "5219b1a6032c5b7a642f79c17d135b114a03a59cb67e7928883a229034ae875f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.161/veryfront-macos-x64"
      sha256 "2e1ada86f2b4479199adce91fc8113a8e9cb05d42c0efe03743c1da9e97bb9f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.161/veryfront-linux-arm64"
      sha256 "048965a015c9510924cc0bbab6141997004db28bfc8b80968ba637eda5056736"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.161/veryfront-linux-x64"
      sha256 "6e186151b3900b731dbd25fab0d2297c4fda18d74a895ce942447cd5c5a64135"
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
