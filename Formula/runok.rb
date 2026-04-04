# frozen_string_literal: true

class Runok < Formula
  desc "Command execution permission framework for LLM agents"
  homepage "https://runok.fohte.net"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-apple-darwin.tar.gz"
      sha256 "e1aa416ce0dfa13661b621d0b8aa7f6cd9b647ebcb8cfdf52772c5bfbb998247"
    end
    on_intel do
      odie "runok is not available for macOS Intel (x86_64). Only Apple Silicon (arm64) is supported."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c597633dca735e96e5f02c7a6974b267a21815cec8ed6cb46ff26df22328276"
    end
    on_intel do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3771658b89d42cd7c40343661c0fa7e71e6fa98d36cd00d72493eb8d911dec6"
    end
  end

  def install
    bin.install "runok"
  end

  test do
    assert_match "runok #{version}", shell_output("#{bin}/runok --version")
  end
end
