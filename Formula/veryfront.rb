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
  version "0.1.680"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.680/veryfront-macos-arm64"
      sha256 "70104d1aaa8a501d44be6cfaf55809df735ea178e46d7874db6d896752d51ede"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.680/veryfront-macos-x64"
      sha256 "9952d855e2d6eba9902c2980ac2a432602021560e3fa4d7edc35240914e20c7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.680/veryfront-linux-arm64"
      sha256 "e328f8e3f2caad9fa66cf122811f638b707209820f887797d5b68c935e59afb4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.680/veryfront-linux-x64"
      sha256 "c4b4bbaa4eac53bdc12567920a3998c24d30d608560b577c274032c3780d693a"
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
