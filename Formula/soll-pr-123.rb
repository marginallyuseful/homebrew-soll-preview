class SollPr123 < Formula
  desc "Soll preview build (PR #123)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.123.c943c80c"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-123-c943c80c/soll-pr-123-macos-arm64"
    sha256 "25030acdc6a70d1d05c6779e77106e0c698c2e398266542ade80fc129f952396"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-123-c943c80c/soll-pr-123-linux-arm64"
      sha256 "1c1e01b36dd17ea2a57e56fddb2be7241d8b74eff5ff9d0c87f403c6f8baef7e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-123-c943c80c/soll-pr-123-linux-x64"
      sha256 "f269bcdb28ccfac3160ebaf7f8abf30bfb224b41a8f65b2c7b7d94a2536876f4"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-123"
  end

  def caveats
    <<~EOS
      Experimental build from PR #123.
      Do not use in production. The binary is installed as
      `soll-pr-123` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-123", "--help"
  end
end
