class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.7/acm_0.1.7_darwin_arm64.tar.gz"
      sha256 "3b39cf5e36ebc25029f7dcf6c633487c4c4f2b6773ebbc860bd2bcb931fc9957"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.7/acm_0.1.7_darwin_amd64.tar.gz"
      sha256 "810542121eeb92bdf5a070f21c13575a0f50c419fc4aeaff3e467fbe47c62b47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.7/acm_0.1.7_linux_arm64.tar.gz"
      sha256 "ec38fc0fc407e4e246ac039047773a10a50f43e2301862a15141124a2395a105"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.7/acm_0.1.7_linux_amd64.tar.gz"
      sha256 "99d3cf773594167e8351c215c6900daee1cd45a31d409a31e5633cecaf6b0cb9"
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
