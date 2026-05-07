class SollPr124 < Formula
  desc "Soll preview build (PR #124)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.124.0c2ea2d3"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-0c2ea2d3/soll-pr-124-macos-arm64"
    sha256 "9a89e95531c9e6043a9e98bc49702849cb725c9d9ee835e6c7a1469e2f618bec"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-0c2ea2d3/soll-pr-124-linux-arm64"
      sha256 "405a747296b6c777d985fe5fd54606cd3365e875e0bb61dabfba350918eee13b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-0c2ea2d3/soll-pr-124-linux-x64"
      sha256 "b39489d590827c860f8f86bbbb64888f38f1b1c5f76f6fc773c8e48654293b45"
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
