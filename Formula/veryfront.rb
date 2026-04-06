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
  version "0.1.139"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.139/veryfront-macos-arm64"
      sha256 "38f556b0b40a2365e125562b8f3c03fb4557b3325179b9966f944b7eff272fab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.139/veryfront-macos-x64"
      sha256 "0af7a920830c1363758ddb254258e0923d59bcc262001a762b5880535518f87e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.139/veryfront-linux-arm64"
      sha256 "936cadd608652065ae219fcc2405e4da1f8f209e633ba05aebc57b32259054f5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.139/veryfront-linux-x64"
      sha256 "b8217bd75ba613fb40e300940234516714356d280889c537dd1977c43058af31"
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
