class SollPr130 < Formula
  desc "Soll preview build (PR #130)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.130.4ed10c5b"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-4ed10c5b/soll-pr-130-macos-arm64"
    sha256 "41b73be69363eceb26901afd6d490c10a4c83843bcf5f7454fdcf28754d2b225"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-4ed10c5b/soll-pr-130-linux-arm64"
      sha256 "c872609b1c2aa76ba9c634f3480ebfb2c0874b92e86804f51cac803cb8d2a9d7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-4ed10c5b/soll-pr-130-linux-x64"
      sha256 "b86e20dd175cf9253bc640fb95bcfb202e1a964c5dfc5e1d323b3d50de7ee455"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-130"
  end

  def caveats
    <<~EOS
      Experimental build from PR #130.
      Do not use in production. The binary is installed as
      `soll-pr-130` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-130", "--help"
  end
end
