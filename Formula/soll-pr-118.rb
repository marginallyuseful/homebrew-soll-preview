class SollPr118 < Formula
  desc "Soll preview build (PR #118)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.118.68769658"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-118-68769658/soll-pr-118-macos-arm64"
    sha256 "bec4894eb5851ec56bba047c9d3956db8b4d0054c2d93dc77f1c1c007098971b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-118-68769658/soll-pr-118-linux-arm64"
      sha256 "c2d39d93636de460d1da40d18a818f25a230e297b11659c18f99fca3c2cce366"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-118-68769658/soll-pr-118-linux-x64"
      sha256 "f28df3328035b6b2a45aa19d439f49b38796ee4e26ba3734dfdaebea11240162"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-118"
  end

  def caveats
    <<~EOS
      Experimental build from PR #118.
      Do not use in production. The binary is installed as
      `soll-pr-118` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-118", "--help"
  end
end
