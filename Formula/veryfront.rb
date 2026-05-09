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
  version "0.1.441"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.441/veryfront-macos-arm64"
      sha256 "ec0732974b9b7c464354306075eef7b2126873343db7bcf0afb96a8dda70b606"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.441/veryfront-macos-x64"
      sha256 "ba8c2b4a27a490cd876d34cebabe11f1221a45cee571ba5498931706ba49a6cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.441/veryfront-linux-arm64"
      sha256 "afc76c16774cede7b2710e4cbb84b2d8ba5d7e0cca49a2d0b5b5a930f185fbe6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.441/veryfront-linux-x64"
      sha256 "fbe25beb9130fe83a693efeb636b95b65b89f7adcb4cff766fbe151c53632a99"
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
