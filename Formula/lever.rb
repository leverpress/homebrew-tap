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
      sha256 "a1430fafd46e8d3613edb09ae5a10b230505e82455bb8b360d2e5aa8bcea8a0c"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-apple-darwin.tar.gz"
      sha256 "1e364d6ff5b8d684a1813a5f4fb3cb75a44a587711fb3e5d8e3e55e3e16063c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f2e9b59b3ff23046f069df9f1922f13437716871948bdfa8c7a6e6a269b717b"
    end
    on_intel do
      url "https://github.com/leverpress/lever-cli/releases/download/v#{version}/lever-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f877241d82e283082f14f9bfb9e9941646d164ea034441ce1087dab1a02cf8b4"
    end
  end

  def install
    bin.install "lever"
  end

  test do
    assert_match "lever", shell_output("#{bin}/lever --version")
  end
end
