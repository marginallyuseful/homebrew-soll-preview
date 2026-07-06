class SollPr134 < Formula
  desc "Soll preview build (PR #134)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.134.b7730a5c"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-b7730a5c/soll-pr-134-macos-arm64"
    sha256 "3058018fb00c61a90f806dd3327b28165d7b7b1e78dc5e8a1f48c597532d9a90"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-b7730a5c/soll-pr-134-linux-arm64"
      sha256 "e02b4129445e0141817d341e89fd21c4a0f22b4719078ac3755991ed1114527f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-134-b7730a5c/soll-pr-134-linux-x64"
      sha256 "47e1faedcb77dc79eee197f948d578aa34454d5f6dff98491ad78d9445b15eaf"
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
