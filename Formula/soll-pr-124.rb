class SollPr124 < Formula
  desc "Soll preview build (PR #124)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.124.0544384e"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-0544384e/soll-pr-124-macos-arm64"
    sha256 "16bdaa520314be3faf15766fcfa12294b2b4d421d9ada4f3505c0c4fded48fb8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-0544384e/soll-pr-124-linux-arm64"
      sha256 "1668853028c4b9a210f2f0d9a14762580d2e2c5186abc68a5de42c17278356d6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-0544384e/soll-pr-124-linux-x64"
      sha256 "9ff1d030592d7cabb093d13072a25bd0fa727e7df8bf9ca6ded5976571d1e149"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-124"
  end

  def caveats
    <<~EOS
      Experimental build from PR #124.
      Do not use in production. The binary is installed as
      `soll-pr-124` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-124", "--help"
  end
end
