class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.3/acm_0.1.3_darwin_arm64.tar.gz"
      sha256 "4c475a9c9024126c6d1e73868b1053d0c12f128dae9fc4d698cb49c7cd33e10e"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.3/acm_0.1.3_darwin_amd64.tar.gz"
      sha256 "6e34e9bb5d1292fa06993b5118f25f2463fc320df688d5de7889b11c0b092c5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.3/acm_0.1.3_linux_arm64.tar.gz"
      sha256 "f722c880aadeedea8096d23df4df65c2411dc65f27e6a4cb47da804ec6245168"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.3/acm_0.1.3_linux_amd64.tar.gz"
      sha256 "6e52c624f7fc4ab39e55bccfc3690661535c722e33811bdf73c905a9a183f58e"
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
