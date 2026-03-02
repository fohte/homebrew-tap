# frozen_string_literal: true

class Runok < Formula
  desc "Command execution permission framework for LLM agents"
  homepage "https://runok.fohte.net"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-apple-darwin.tar.gz"
      sha256 "39454134063ce1b1a0eec911d8348b3dd6641f92fc56227bd234d223ff959931"
    end
    on_intel do
      odie "runok is not available for macOS Intel (x86_64). Only Apple Silicon (arm64) is supported."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db783a33de1bacbdc17976b96451c6788395f0205bcb02676391c75ab161a81b"
    end
    on_intel do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35a991f6a5c4151a49bcf3f67a68b9101b32522e7fd648b22c7ccdf3a773d467"
    end
  end

  def install
    bin.install "runok"
  end

  test do
    assert_match "runok #{version}", shell_output("#{bin}/runok --version")
  end
end
