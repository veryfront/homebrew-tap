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
  version "0.1.675"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.675/veryfront-macos-arm64"
      sha256 "e31d88f34eca60081bc7d138fc36fc05249ef493ad90b8fed53a497d6143bbce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.675/veryfront-macos-x64"
      sha256 "bee52db7710f35aec2709a2044584eba64c189633a9657499293b069223f8a0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.675/veryfront-linux-arm64"
      sha256 "ac438499898972a3f48e7bf5acd87a9baf4fb3c008ce47f544820ce7965121be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.675/veryfront-linux-x64"
      sha256 "ab35579784ecf26f03ce50541320254bac6f983a181d13a599f17b8eae2773e0"
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
