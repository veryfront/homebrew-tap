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
  version "0.1.731"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.731/veryfront-macos-arm64"
      sha256 "706e2d2c3edb47bb0cdfb70691238ea3953831e536fe2dfc77b209ae0eae7b5f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.731/veryfront-macos-x64"
      sha256 "28634473f647a93070378352582c707bed62c07414bbca3b798bba79154d79a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.731/veryfront-linux-arm64"
      sha256 "2789c8116c67f6848cd400a4168576ba005e252e4232f29b349d426b27c06d24"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.731/veryfront-linux-x64"
      sha256 "80b57550ba66810393e44ead7c6f75ffd5dfd5b24a347fc9925bd58317278d5f"
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
