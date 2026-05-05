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
  version "0.1.383"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.383/veryfront-macos-arm64"
      sha256 "e423d1bf9ae0ca9d267cd29e753c097e510e7bff899b0a938a61ef4b8d3c41ca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.383/veryfront-macos-x64"
      sha256 "cf793b4ec10c4c1b068cab32436de1bde983cd757a16609a2f26715f79badba7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.383/veryfront-linux-arm64"
      sha256 "65951f958629059b75e28ad5732a7cb0130dbfcfd8543caa9fb84519cc30bd1c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.383/veryfront-linux-x64"
      sha256 "002783b660203ff00cbc5fc73b10db528119cc63e55b9c3835e2fd656bf5caaa"
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
