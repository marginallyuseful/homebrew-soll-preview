class SollPr122 < Formula
  desc "Soll preview build (PR #122)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.122.f80ea8f3"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-122-f80ea8f3/soll-pr-122-macos-arm64"
    sha256 "6a3131ba8d600804bf52f6b696e915b05bafe45e3c9cf3cfff7284cbfa06a70a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-122-f80ea8f3/soll-pr-122-linux-arm64"
      sha256 "a90b435ad73e6728199e8f7004deb71119ee3d193693d6a36ddaf9f761ea041f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-122-f80ea8f3/soll-pr-122-linux-x64"
      sha256 "2ae5c03aefa6f0c504b0b8c349316bb8ec208bbd059b5885aae998fed79347c8"
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
