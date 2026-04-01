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
  version "0.1.122"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.122/veryfront-macos-arm64"
      sha256 "8f8725425b83c189de9f1e3129cd3adf147324411a0dd9c53d14f60bb72404cc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.122/veryfront-macos-x64"
      sha256 "03eadb0daee9725dfba9e63dd329fab8c96e4607675fdaedf0505b467d3bbf05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.122/veryfront-linux-arm64"
      sha256 "b45b9d05c2d4458befe21d7e68da9887d325d2060fe9a09a7ce1bde9bd4179ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.122/veryfront-linux-x64"
      sha256 "3f2939e0f5fb3ae08a1f23cc9763c1e91b0d4da7adf29aacc1fc38c8c4c57290"
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
