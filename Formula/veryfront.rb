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
  version "0.1.1191"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1191/veryfront-macos-arm64"
      sha256 "4e00a3177751589fb8dcadfc2616ad3e9f8f5baf6058dbc8eb13f7a21d3773a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1191/veryfront-macos-x64"
      sha256 "538cd07bf6c65be798d1eb4666f1eb0466bd94e664331497001449296c104dfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1191/veryfront-linux-arm64"
      sha256 "fc604717ca5b827d1b9b6a43620b3ee5eb02897b00df39898616124d8434f5db"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1191/veryfront-linux-x64"
      sha256 "c200724f7566f92c034f6155b8bc8166713ea616ccb00f48ca3415869ba72698"
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
