class SollPr130 < Formula
  desc "Soll preview build (PR #130)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.130.75963b7b"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-75963b7b/soll-pr-130-macos-arm64"
    sha256 "8989c16255fe2eb3f98ce3ba27084e92cd4121cf87efe3b40c9eb69f88860c60"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-75963b7b/soll-pr-130-linux-arm64"
      sha256 "85c9bb9f332dfdb81b5e84d68eac856f5fbb5ae29c2bb16ce5a5f16fdb6fa654"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-130-75963b7b/soll-pr-130-linux-x64"
      sha256 "994216c7ec637515584cdf3ccad40b9031f878c1bf22ce886912538b8d1217ed"
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
