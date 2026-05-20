class SollPr129 < Formula
  desc "Soll preview build (PR #129)"
  homepage "https://github.com/marginallyuseful/soll"
  version "0.0.0-pr.129.b9608284"
  license :cannot_represent

  on_macos do
    url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-129-b9608284/soll-pr-129-macos-arm64"
    sha256 "1d4d57cf8351b83e0ef47a941e3c46d71cd628d666de74c375fa1eaaf107b497"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-129-b9608284/soll-pr-129-linux-arm64"
      sha256 "60705a8e06e0ca7e487b30bb0817aff77f23ca69f652ff8f5eb80c7dda5bb267"
    end
    if Hardware::CPU.intel?
      url "https://github.com/marginallyuseful/homebrew-soll-preview/releases/download/pr-129-b9608284/soll-pr-129-linux-x64"
      sha256 "f8e4ff7b5ccb0840ad6eb0464ed041964fecc1fd1a6fd3e2e6237ec2d6ebca38"
    end
  end

  def install
    bin.install Dir.glob("*").first => "soll-pr-129"
  end

  def caveats
    <<~EOS
      Experimental build from PR #129.
      Do not use in production. The binary is installed as
      `soll-pr-129` so it does not collide with stable `soll`.
    EOS
  end

  test do
    system "#{bin}/soll-pr-129", "--help"
  end
end
