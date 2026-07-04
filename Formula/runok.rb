# frozen_string_literal: true

class Runok < Formula
  desc "Command execution permission framework for LLM agents"
  homepage "https://runok.fohte.net"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-apple-darwin.tar.gz"
      sha256 "e620f3a968cac4e945ecba12db40a58a0cf88d874770318345803c827fce3a4b"
    end
    on_intel do
      odie "runok is not available for macOS Intel (x86_64). Only Apple Silicon (arm64) is supported."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18cd58c924d7d3de82d30b64065c4f961bc5d8e33a359d55b6611ff1c7a16ea4"
    end
    on_intel do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3856af9c2324531bfee938791cc751f06b750a4d04dd6096de7ae5972f754367"
    end
  end

  def install
    bin.install "runok"
  end

  test do
    assert_match "runok #{version}", shell_output("#{bin}/runok --version")
  end
end
