class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.9/acm_0.1.9_darwin_arm64.tar.gz"
      sha256 "b9aaf15b2fd6388a5381f315b635849e97fb2b3978056710607d651ff53217da"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.9/acm_0.1.9_darwin_amd64.tar.gz"
      sha256 "9a018d5fedd9f3c19717699e2d1c2d210e661b13857d713aa4a005e9fdcb0f46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.9/acm_0.1.9_linux_arm64.tar.gz"
      sha256 "9205f9dc97adc7c1032f918992a727016efac4781384199c87bf3b11f229556b"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.9/acm_0.1.9_linux_amd64.tar.gz"
      sha256 "69de18acc402d3b2afc020b6e380c3efe408989b7736f329309eb650d74e1dca"
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
