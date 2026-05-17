# frozen_string_literal: true

class Runok < Formula
  desc "Command execution permission framework for LLM agents"
  homepage "https://runok.fohte.net"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-apple-darwin.tar.gz"
      sha256 "044ef35c0e25a90905ee57d5681937b9b7b1ebd409a1269b3dfa66ea598ffc26"
    end
    on_intel do
      odie "runok is not available for macOS Intel (x86_64). Only Apple Silicon (arm64) is supported."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64ca3973c116de941bbbf0103bcdf02fe6055933ad1d10f011697535f53afd21"
    end
    on_intel do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf831f913df6bdb3fcd7484d9ad2a1092b8cf04cea98201db2ef8653ce7fdfd7"
    end
  end

  def install
    bin.install "runok"
  end

  test do
    assert_match "runok #{version}", shell_output("#{bin}/runok --version")
  end
end
