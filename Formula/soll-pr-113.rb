class SollPr113 < Formula
  desc "Soll preview build (PR #113)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.113.27161424"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-113-27161424/soll-pr-113-macos-arm64"
    sha256 "4a9a129a8faf65544ae4af103950fbea71f2162546b6e939568f3d8052af3c02"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-113-27161424/soll-pr-113-linux-arm64"
      sha256 "de7572849640487a378992249da37e5b49574ed6d29222241165ef89900630c8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-113-27161424/soll-pr-113-linux-x64"
      sha256 "3963eccd1a8b8426364213749d3ecaffafeda2391bcfd229b45efe5d83fb896c"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-113"
  end

  def caveats
    <<~EOS
      Experimental build from PR #113.
      Do not use in production. The binary is installed as
      `soll-pr-113` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-113", "--help"
  end
end
