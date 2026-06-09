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
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ARM64_MACOS_SHA256"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_X86_64_MACOS_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_ARM64_LINUX_SHA256"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_X86_64_LINUX_SHA256"
    end
  end

  def install
    bin.install "lever"
  end

  test do
    assert_match "lever", shell_output("#{bin}/lever --version")
  end
end
