class SollPr122 < Formula
  desc "Soll preview build (PR #122)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.122.d39ee294"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-122-d39ee294/soll-pr-122-macos-arm64"
    sha256 "afe019a189ef1d41cd61549571a4b70dd81e1eb1a91938b00dde810619a04bc6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-122-d39ee294/soll-pr-122-linux-arm64"
      sha256 "f08ac00452e730181ae97789a8740aec306c66b3d9f8d266d3a42c5dde39d53b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-122-d39ee294/soll-pr-122-linux-x64"
      sha256 "c43e7e7ea587f8d4162f0633519007f29366c1c14d785a1e06f6c2ead56d3478"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-122"
  end

  def caveats
    <<~EOS
      Experimental build from PR #122.
      Do not use in production. The binary is installed as
      `soll-pr-122` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-122", "--help"
  end
end
