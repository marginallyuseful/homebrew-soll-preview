class SollPr130 < Formula
  desc "Soll preview build (PR #130)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.130.d18b286c"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-d18b286c/soll-pr-130-macos-arm64"
    sha256 "6f35a852069ca1f51eb293fea83de35b8688fb1dd49c80ae4c3746119641713d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-d18b286c/soll-pr-130-linux-arm64"
      sha256 "5599f455c51996d5edb4ba98e6547d2a1e56225cbc05c4c0d881f62332afb773"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-d18b286c/soll-pr-130-linux-x64"
      sha256 "f0f43c6316ff106b2b9080dbf78ec17d02b702977abb301884cfa871a10aefbf"
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
