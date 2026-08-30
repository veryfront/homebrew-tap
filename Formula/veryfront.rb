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
  version "0.1.1254"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1254/veryfront-macos-arm64"
      sha256 "228598e8194be27b2613d1a5b5369711aee212f2909a1d73deebc7f35622b032"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1254/veryfront-macos-x64"
      sha256 "4a40d90e85d548c0f9628b61dced797acc7461e167972e5268550c1b267dc240"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1254/veryfront-linux-arm64"
      sha256 "bcbc551527528ad45dfee5c70675c7ff1237ade4e488b95cb826ade8bff0009b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1254/veryfront-linux-x64"
      sha256 "d4281f1b1bfe09f71a8e195e3ecb842e500753c78dcc5850a91ec39b1176aae6"
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
