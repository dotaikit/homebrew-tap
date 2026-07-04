class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.10/acm_0.1.10_darwin_arm64.tar.gz"
      sha256 "c24a9e56d860df6d134900c4d44e8ed21a0eff0250e122de383cd8f1c5134962"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.10/acm_0.1.10_darwin_amd64.tar.gz"
      sha256 "e62a88d6acfbfbe4affbad960b79d6b753dfdd9b33105057cd243339a7b12260"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.10/acm_0.1.10_linux_arm64.tar.gz"
      sha256 "a5a35bbafa8c7fea471efbfe92f164bd75f2f960d6662e31f24d16fdc1edfea1"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.10/acm_0.1.10_linux_amd64.tar.gz"
      sha256 "faa2a50b92d252ffbee80ffabb6ad06075f651410345e66dcd07d9e8fd4b3283"
    end
  end

  def install
    binary = File.exist?("acm") ? "acm" : Dir["acm_*/acm"].first
    odie "acm binary not found" if binary.nil?
    bin.install binary => "acm"
  end

  test do
    assert_match "acm", shell_output("#{bin}/acm version")
  end
end
