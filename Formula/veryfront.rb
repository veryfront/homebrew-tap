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
  version "0.1.1179"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1179/veryfront-macos-arm64"
      sha256 "a38869f057895cffabddbcfc974e81f698e8eff5a0c8490be6178786547c665c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1179/veryfront-macos-x64"
      sha256 "47e8adf3c55cc2fb47b5105030f99abea986ecd36700239eee481ce1ba1f96e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1179/veryfront-linux-arm64"
      sha256 "344df78bf3ef259cfd1d6d106ebb5b2d4454108f2daa8102946adedd5a97cd2b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1179/veryfront-linux-x64"
      sha256 "a803df2cf736fcd22ce2e0dcca233bf86828882c612d4b2e802bffaf3a72dd89"
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
