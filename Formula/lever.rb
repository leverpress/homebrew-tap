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
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-apple-darwin.tar.gz"
      sha256 "003ca3c7f4ed25e42fd1570fcc585b2766157c52ce066749e97db28723b85324"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-apple-darwin.tar.gz"
      sha256 "f3c5c4a1246ec76f7a9e953c3d241fa7baccf8b63a0be9e9fd4b260d815540f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a85e43c3ec08c06d1df2e7b368ffe9f3e6db90144b8ce0aeb549a2b73fc6e6b"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "86d1d338c3d099d35e54df5db556e2592a2f23c247742833600d43da09c0e4cf"
    end
  end

  def install
    bin.install "lever"
  end

  test do
    assert_match "lever", shell_output("#{bin}/lever --version")
  end
end
