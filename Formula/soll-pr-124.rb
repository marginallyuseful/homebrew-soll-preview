class SollPr124 < Formula
  desc "Soll preview build (PR #124)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.124.04c716fb"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-04c716fb/soll-pr-124-macos-arm64"
    sha256 "136413b45355535c85559d887dc7aca4be21a7bf4977c2b81bb15fc5b546f1b0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-04c716fb/soll-pr-124-linux-arm64"
      sha256 "2829df2d5957f79a1c3f16f385b65e19411e0baeb69ec6b0a438f74a7e797f57"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-124-04c716fb/soll-pr-124-linux-x64"
      sha256 "736444dd8bd3e538da7d5789c11bd31b4a03bbf44b237ead142207cb2ce6ab24"
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
