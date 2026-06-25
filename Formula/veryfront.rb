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
  version "0.1.933"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.933/veryfront-macos-arm64"
      sha256 "562d7ef22e609f5a5a55d433b91b8cf19d89e55b61f7878055fe4805d00ba6ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.933/veryfront-macos-x64"
      sha256 "11addf3735debf1222d4e31eaf29e9a9632adbdd54ffca13f7ecb54ea22e4cd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.933/veryfront-linux-arm64"
      sha256 "ebc05fc233134225775330f0203a8bc4d30291f40776f7354222340f5cbc0979"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.933/veryfront-linux-x64"
      sha256 "b65cd558693054b8acf3a6205eea0ab27881f2534831d741a67afc72ed7887da"
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
