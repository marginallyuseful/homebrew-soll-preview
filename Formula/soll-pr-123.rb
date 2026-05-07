class SollPr123 < Formula
  desc "Soll preview build (PR #123)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.123.41676275"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-123-41676275/soll-pr-123-macos-arm64"
    sha256 "9b51c9b8763f636dd43437d64f122ca03b1be2239857cfde39f8f9e83b5b2691"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-123-41676275/soll-pr-123-linux-arm64"
      sha256 "65ae773b73ea2f44608b873fd6e68cb63dc38ef694c35027a805bd8038b5d5a8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-123-41676275/soll-pr-123-linux-x64"
      sha256 "892eb5295f8ed80ad6f53e97bb72df823a1adbc3c76527a2d676f815f709d1cd"
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
