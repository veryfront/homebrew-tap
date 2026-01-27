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
  version "0.0.93"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.93/veryfront-macos-arm64"
      sha256 "cd2fb07525b342efa715fc66546a777ca06283e96bb9846e94414c5a5e4539ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.93/veryfront-macos-x64"
      sha256 "1692158ac62af10856d09fbb945636a8c709a0197f957d8be49419432a979081"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.93/veryfront-linux-arm64"
      sha256 "68f3e1b6c754a79c4f4087cd4299efd991dd7ee5a361808944f6b032ac9b3a98"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.93/veryfront-linux-x64"
      sha256 "18b1f0ce86ec76379dfbcdb230d30e835ae8fa3b53dabbdf2efe7b14917c7d9d"
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
