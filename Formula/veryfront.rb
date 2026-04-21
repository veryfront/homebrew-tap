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
  version "0.1.232"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.232/veryfront-macos-arm64"
      sha256 "4a34a294df63516ac825693bbce4b2a457a79151b478b932f249fbbc873be083"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.232/veryfront-macos-x64"
      sha256 "6eae2bd023d0c842c7e2bad3345e2a47497690eb152d2ca8762c73b6e8412d70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.232/veryfront-linux-arm64"
      sha256 "0f737f8ac6a56e1c431fd1c5f134020e80e7d353ad2329644cd7d1bc26a83549"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.232/veryfront-linux-x64"
      sha256 "bf00b8c01b4d0491ecbd3f4e6b3b9ba3235468731411c9d224a48744c063224b"
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
