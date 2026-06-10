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
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-apple-darwin.tar.gz"
      sha256 "0cdfa8af7ad6844a91e8b09b383b5e5c484143107951f2f05f88b44c26cbb793"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-apple-darwin.tar.gz"
      sha256 "ef5d24070f7a115a532faffa8f0549d40d6c24c46ec784e7bfbbf67f9e21712c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75dc1c612860c044f71f7e540031297b82a31fb2657a9c8509ef32d64ab12b98"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f686617c350da9e7b6bdd2ce35e3ccf499bfeb05dac27b406bf13e6395f97a5d"
    end
  end

  def install
    bin.install "lever"
  end

  test do
    assert_match "lever", shell_output("#{bin}/lever --version")
  end
end
