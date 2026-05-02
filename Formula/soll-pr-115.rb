class SollPr115 < Formula
  desc "Soll preview build (PR #115)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.115.9841f5b6"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-9841f5b6/soll-pr-115-macos-arm64"
    sha256 "ffa6720df51bf70ddc876439be51f1ac86e8e54a47171e584b025c9edb839687"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-9841f5b6/soll-pr-115-linux-arm64"
      sha256 "8ff3d994194b3958796124e38ada7e378d9c06c524a610f6457b4045fb7fdca8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-9841f5b6/soll-pr-115-linux-x64"
      sha256 "72edbfc766e186b140bd980575b65fc5d4fc83b0ab9565e503fd1abe79032a8f"
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
