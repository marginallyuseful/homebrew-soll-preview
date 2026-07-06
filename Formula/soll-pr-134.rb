class SollPr134 < Formula
  desc "Soll preview build (PR #134)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.134.e46ee62c"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-e46ee62c/soll-pr-134-macos-arm64"
    sha256 "4ba66c4646964949a310fdfba0abecddcfab813b628bb7e2b39054df9b9c4f16"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-e46ee62c/soll-pr-134-linux-arm64"
      sha256 "5ecac5bddf39517fd2870a67ba4d9c0016a507636212b5f0078fc94302801432"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-e46ee62c/soll-pr-134-linux-x64"
      sha256 "04a8fcb71114a4e65a04e251643fa795b28fc0d4de5e86d04089d51cf9f99e56"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-134"
  end

  def caveats
    <<~EOS
      Experimental build from PR #134.
      Do not use in production. The binary is installed as
      `soll-pr-134` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-134", "--help"
  end
end
