class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.20/acm_0.1.20_darwin_arm64.tar.gz"
      sha256 "839221fdd7e1498a7d4b6317edd34fd83702db04d0830709c538dc369475eb8b"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.20/acm_0.1.20_darwin_amd64.tar.gz"
      sha256 "c3960fe89d30104ffaab0706f0051fb04e3eb1c44423ea8deb36f57d1dda0d34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.20/acm_0.1.20_linux_arm64.tar.gz"
      sha256 "60d74855698e49afb63634f0519deaf1dd887bc76fbbc3d42f38794004060509"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.20/acm_0.1.20_linux_amd64.tar.gz"
      sha256 "3b8e820caeb4c73c353cfa6eeacaaa633153bf6fa7912b3e62e49f7dd39c5ad0"
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
