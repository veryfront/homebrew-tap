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
  version "0.1.671"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.671/veryfront-macos-arm64"
      sha256 "d170f8a4b0f9f7167d58d94e223e1caa19181808d4e919b4f3d398dc7edbe19b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.671/veryfront-macos-x64"
      sha256 "a7d0a2f5614214df40bc25fc05bdbf2b36c4dbc576956311f200c98bee27dc75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.671/veryfront-linux-arm64"
      sha256 "9afc46023d73ecadd5c3e257153d14efb4af78b4354f10ed967935694aa2a6c8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.671/veryfront-linux-x64"
      sha256 "38e1dcaaee48d44778a11442733f13d55bb6a21d7e322fd8bfb7e1552daefeb7"
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
