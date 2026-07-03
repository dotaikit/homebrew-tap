class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.6/acm_0.1.6_darwin_arm64.tar.gz"
      sha256 "2b22eaf8d6b224bdeb37612ebe2b38ae4c059c2ac4ba472f3039f2f2a91938fc"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.6/acm_0.1.6_darwin_amd64.tar.gz"
      sha256 "c95cf05921ee7657184c455cf725d22442c3b0cf83337a65ce491e0809b6c87f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.6/acm_0.1.6_linux_arm64.tar.gz"
      sha256 "c20528f79e598607ec6fd325d00db008135c7f196849025a5ae148ff760a4576"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.6/acm_0.1.6_linux_amd64.tar.gz"
      sha256 "29ad7b82daad32fd02f083da203541f930f68bdd7e21e8c902a3b3cbdb14bfae"
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
