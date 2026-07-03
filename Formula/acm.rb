class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.5/acm_0.1.5_darwin_arm64.tar.gz"
      sha256 "461553c8d019573b067f79dc76bb98cf1f87f9b539273371979fac3d4b815e5d"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.5/acm_0.1.5_darwin_amd64.tar.gz"
      sha256 "fadb5bb06c9c7bdeabcdcc48635f4f9b258e43995b54579631d588464d1c57fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.5/acm_0.1.5_linux_arm64.tar.gz"
      sha256 "5f971361ae40b6faa3ff28cb0a3f96c110fdc4dd9be517ac55574946421666bc"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.5/acm_0.1.5_linux_amd64.tar.gz"
      sha256 "347306c46bfdc3831058cac4864246b511ea4cec69930ed4f8fd11c112fe30b4"
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
