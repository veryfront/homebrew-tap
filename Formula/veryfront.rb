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
  version "0.1.446"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.446/veryfront-macos-arm64"
      sha256 "ae9b40894d6829b7fbb824b78bd74e41c6c77b530bece96dc8ff9a77259049fa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.446/veryfront-macos-x64"
      sha256 "0c2cc15b711253777e6cb739e4626711e77381b519a9673aaf07ecb88a3c1863"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.446/veryfront-linux-arm64"
      sha256 "32a7eee32667016262eb84f8c0f74edb1e42c59661dc8e841de2749373b07749"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.446/veryfront-linux-x64"
      sha256 "4df96e2208ae81e11184cc63a8e1b06bd4ce53577b26a447386371137d9a7c75"
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
