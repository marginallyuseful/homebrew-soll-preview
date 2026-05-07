class SollPr125 < Formula
  desc "Soll preview build (PR #125)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.125.5fcd0331"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-125-5fcd0331/soll-pr-125-macos-arm64"
    sha256 "fc40730be21b874ed8234da576e69d13d430ce50a9e00a67a11655d23bde6c7b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-125-5fcd0331/soll-pr-125-linux-arm64"
      sha256 "433f53a119cfeda24d05d38d305836192fa11ce006591a47955c48b6c60f252e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-125-5fcd0331/soll-pr-125-linux-x64"
      sha256 "3a0e5a0a5096af3b67b3aee373248d07b12b0ae081bf6be3c21375535069fcb3"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-125"
  end

  def caveats
    <<~EOS
      Experimental build from PR #125.
      Do not use in production. The binary is installed as
      `soll-pr-125` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-125", "--help"
  end
end
