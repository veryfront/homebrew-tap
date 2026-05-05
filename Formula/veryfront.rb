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
  version "0.1.384"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.384/veryfront-macos-arm64"
      sha256 "a0d40150d553f9b58b844adbe621459b88cc012444005e0fb8b58b4bdd266cb7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.384/veryfront-macos-x64"
      sha256 "445191a9f465889a363bcc20425143a9a63aa56b9cb0abff0ab2658661506dde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.384/veryfront-linux-arm64"
      sha256 "6ca5fe9f6862b780186e338a65c060969649854062d020076999bde7cc56f00e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.384/veryfront-linux-x64"
      sha256 "1082797e613fa205646b17ba7eb6eaaafc7a2cf666b357e6bb7c3feb48db84b6"
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
