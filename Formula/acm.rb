class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.11/acm_0.1.11_darwin_arm64.tar.gz"
      sha256 "af97d20098122a0dd696cdd62d628c327b3be948f5cd8788b1c8a6be8e0e5d1a"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.11/acm_0.1.11_darwin_amd64.tar.gz"
      sha256 "61c6a353717907a286e579baecd90411bcca083d0f13cb4422614cafcc98e034"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.11/acm_0.1.11_linux_arm64.tar.gz"
      sha256 "fdcebecc3dd20ede2173d98a269e095b192a193008e22b8df0314da4cbad154f"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.11/acm_0.1.11_linux_amd64.tar.gz"
      sha256 "96bb5ac217510483db6bbcad246c2b2f3d9b10bbafa6dba3b1030fce943cf636"
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
