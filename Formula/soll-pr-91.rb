class SollPr91 < Formula
  desc "Soll preview build (PR #91)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.91.77a96a66"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-91-77a96a66/soll-pr-91-macos-arm64"
    sha256 "931d15ff69d69f0d259d209349b367670ec8deb60723ef539f355fe9cfb5f4ae"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-91-77a96a66/soll-pr-91-linux-arm64"
      sha256 "e6f733233b97c9a3f575f114e35aeef200da8c8a6ac2afaa6bf3b114cf1bb99f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-91-77a96a66/soll-pr-91-linux-x64"
      sha256 "d04b0fa2d7864775e76e297573eac93e4ff9bae55e044fc4e0e7df891941ea7b"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-91"
  end

  def caveats
    <<~EOS
      Experimental build from PR #91.
      Do not use in production. The binary is installed as
      `soll-pr-91` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-91", "--help"
  end
end
