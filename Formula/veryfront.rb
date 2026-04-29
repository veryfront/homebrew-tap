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
  version "0.1.321"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.321/veryfront-macos-arm64"
      sha256 "949c8c52a8710f153c324418cbafa219e589f087080ee95bef38d07272a5448d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.321/veryfront-macos-x64"
      sha256 "4f25b563322d61f9e9a52a1289cb3cbe4102c3caeb2e516e72a9d69815541f75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.321/veryfront-linux-arm64"
      sha256 "14a8be1f597ef9088c7ef2a97d07d24dd6b1bb30a9d41826c87805cdf55d912f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.321/veryfront-linux-x64"
      sha256 "e399602040675df607579a485375cf90f39683e87720024043bddcb2b837efa0"
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
