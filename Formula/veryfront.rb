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
  version "0.1.653"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.653/veryfront-macos-arm64"
      sha256 "9eee34f9670297eaebf8249a6a3115f9258094deb2c554d9c8309201b3f08028"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.653/veryfront-macos-x64"
      sha256 "36c04892eff1dfe4e2dc93a9c4e6656e75afb698a04e6423ad4930023df8efeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.653/veryfront-linux-arm64"
      sha256 "c71e4d096c0e9cca7c74404cfeba1e7c41622650b93bf254957f1c7d4206e838"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.653/veryfront-linux-x64"
      sha256 "41abd1f9f44547e1f2e3d8cffdda75e8e7dd9c8a86b2e76dadc34b31df5ae8e6"
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
