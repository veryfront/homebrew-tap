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
  version "0.1.874"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.874/veryfront-macos-arm64"
      sha256 "ba5bb916483994f38739b4bde1fb9c435a1880b368fcee36e9b3f3ab8465f127"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.874/veryfront-macos-x64"
      sha256 "43ac5100b7a720fdfb2f2bcc241afb6ca9ddec0a14af494b4bd0973bbe906fb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.874/veryfront-linux-arm64"
      sha256 "db446858123a15cadda4ab9f7e86cdf0e8c91abfa69247fd82754a99aaceb904"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.874/veryfront-linux-x64"
      sha256 "a93503e8e8a9d309533c95a23de66e66b4cd784fb5974d9fe6d4d48581ac000f"
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
