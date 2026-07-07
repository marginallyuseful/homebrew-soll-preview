class SollPr134 < Formula
  desc "Soll preview build (PR #134)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.134.83a0e4fc"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-83a0e4fc/soll-pr-134-macos-arm64"
    sha256 "4785409b8276be4da43514b001f2c29e995ae1915728c3193d3dfc98eb10cdec"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-83a0e4fc/soll-pr-134-linux-arm64"
      sha256 "2226b24d54333869f5c729584e7095a714317b187d2c6d8a6544b8e399a6054a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-83a0e4fc/soll-pr-134-linux-x64"
      sha256 "8ba95d6618c66c83c61af048aa71414e5cc1df1aff1d3f69ac0a62a8d6cce7db"
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
