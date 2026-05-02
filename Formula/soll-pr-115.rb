class SollPr115 < Formula
  desc "Soll preview build (PR #115)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.115.7e34dc09"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-7e34dc09/soll-pr-115-macos-arm64"
    sha256 "6e44e97148443afb03a010569a8c444d2821292ef3b2267390be58abb3fbdf07"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-7e34dc09/soll-pr-115-linux-arm64"
      sha256 "b1424e2fb173d4ead43d8234f7d71911f6b1a5a1877247af9ed85ed88ef2d7ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-7e34dc09/soll-pr-115-linux-x64"
      sha256 "95d10513973f02aac0876691db4d91fab699a0c4fbfc69eaf93ace49ab274704"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-115"
  end

  def caveats
    <<~EOS
      Experimental build from PR #115.
      Do not use in production. The binary is installed as
      `soll-pr-115` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-115", "--help"
  end
end
