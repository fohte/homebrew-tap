# frozen_string_literal: true

class Runok < Formula
  desc "Command execution permission framework for LLM agents"
  homepage "https://runok.fohte.net"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-apple-darwin.tar.gz"
      sha256 "f86797ebc69c5ceb87dcdaba435edde151854f38d8c670452d83b96b49cf00bd"
    end
    on_intel do
      odie "runok is not available for macOS Intel (x86_64). Only Apple Silicon (arm64) is supported."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97f1d6c010137950cfccf0ed8ad66f28a6620331b2d0de26fae642d9266fd142"
    end
    on_intel do
      url "https://github.com/fohte/runok/releases/download/v#{version}/runok-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6091a59dd5bfb9250ec9041cc67692c00793390ef6600509f66f1caea7af6f4c"
    end
  end

  def install
    bin.install "runok"
  end

  test do
    assert_match "runok #{version}", shell_output("#{bin}/runok --version")
  end
end
