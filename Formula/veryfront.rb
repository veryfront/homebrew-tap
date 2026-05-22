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
  version "0.1.572"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.572/veryfront-macos-arm64"
      sha256 "97dac20d008e0a5b9270d47d0ef8b4c36ebd0c76b7b8d1ed1d92202e5942fe87"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.572/veryfront-macos-x64"
      sha256 "1eec5a57561cd20907fdf5bea74ca12e25e31e82237f48b07199bfaf654f4797"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.572/veryfront-linux-arm64"
      sha256 "513288d0e2151f8f7cdc7eec2863b69731bca8d6a33dabb7311280650e5c4450"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.572/veryfront-linux-x64"
      sha256 "526d467bf896c46eecf60aa2a70529584fb00776aa40f56d2fbdf5c25725b365"
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
