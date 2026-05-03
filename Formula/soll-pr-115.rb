class SollPr115 < Formula
  desc "Soll preview build (PR #115)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.115.3c8505ea"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-3c8505ea/soll-pr-115-macos-arm64"
    sha256 "d79994e2ae36de55265ee5073a1afcc4968dc81ca6a710d72e18106a66c33445"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-3c8505ea/soll-pr-115-linux-arm64"
      sha256 "dda06d0060ddcd9d5d4b3475371cb24ab67776fe7c0b1ff6af176720a54ab51e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-115-3c8505ea/soll-pr-115-linux-x64"
      sha256 "2469199bd1426d8ae17a88d2eb120d6953aaf53d3401e3a3ab8e2d0d8f26ec2a"
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
