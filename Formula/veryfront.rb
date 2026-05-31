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
  version "0.1.621"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.621/veryfront-macos-arm64"
      sha256 "c1830fac52efee89218e988b662cd0b249982a7dbb69f90d0d1add04f704b48a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.621/veryfront-macos-x64"
      sha256 "631ae50b553289838a1aee519bc7dda9b068243aa863a1e3c55eb0a33d6962b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.621/veryfront-linux-arm64"
      sha256 "09e7fc4c3f42520c102ff01c83375048f465689a9700f670adb2aace812b2b5f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.621/veryfront-linux-x64"
      sha256 "bd67a4582100e5e123a3492bf2d17af2b882df363527db5d55c8bd244d425822"
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
