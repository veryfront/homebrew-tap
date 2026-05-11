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
  version "0.1.488"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.488/veryfront-macos-arm64"
      sha256 "e9fca8c9e32b5837a675f9924fad9505be6c46b9a3f5dde204d23867f380788e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.488/veryfront-macos-x64"
      sha256 "510e374161d5f76d6734aa4fc3a79262a8c11c774c782504d6c4cc0e35396b07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.488/veryfront-linux-arm64"
      sha256 "3a5e1ad3269e35d3fc28731bfad4cd03aba7495b0954b84f6939cb70948e9215"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.488/veryfront-linux-x64"
      sha256 "b16fe839f8ab1c18e49b9bd5e3e811f3988aab3edc69afa169371cf7ace070d8"
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
