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
  version "0.1.376"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.376/veryfront-macos-arm64"
      sha256 "9f09794e1460a689f61ad7c77d249418fddc2a04ab5bac7102cc3117ab2d2600"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.376/veryfront-macos-x64"
      sha256 "e99fe78c91dc77730b5f553aa9f95df1fe458ece314d04d18136ce6bd062807e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.376/veryfront-linux-arm64"
      sha256 "4a518b7e9fb6fb58bccc9443988b7e9850495fd1de91bb93ad1eca58f7de478b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.376/veryfront-linux-x64"
      sha256 "5e8ed26238a1c334b331f64d74f3e341ede9d37c0fa00491dbb004823851ebbc"
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
