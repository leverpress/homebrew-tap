# Homebrew formula for the lever.press CLI. Lives in the tap repo
# `leverpress/homebrew-tap` as Formula/lever.rb so users can:
#
#   brew install leverpress/tap/lever
#
# Update `version`, `url`, and the per-arch `sha256` on each tagged release
# (the release CI can template this file from the built tarballs).
class Lever < Formula
  desc "Publish from files, not platforms — the lever.press CLI"
  homepage "https://lever.press"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-apple-darwin.tar.gz"
      sha256 "7947f04ffaa9d5f239cddb308ecffda7a1e24fa57b7aec9db83d21fd03cd3944"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-apple-darwin.tar.gz"
      sha256 "3758f172d48d1332a28e982a1a7422eec9e8fbd80fca2f73d9f5d7ee3e06991e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "285a546154ca0cf3feb809b03b95b4df3cd1ff4e780b128f920b65bab2ff43d6"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc84f1938584553213295861ac6599174d4b559d3d6be7e7bb89661ecc839a01"
    end
  end

  def install
    bin.install "lever"
  end

  test do
    assert_match "lever", shell_output("#{bin}/lever --version")
  end
end
