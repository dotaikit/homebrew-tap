class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.4/acm_0.1.4_darwin_arm64.tar.gz"
      sha256 "8a7715bdbd98b3ed5f764c43bde64739a37bd08bbb18c03e70aaa15d25bb4754"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.4/acm_0.1.4_darwin_amd64.tar.gz"
      sha256 "a9a656d71b174bb9387fb12ad802636fb3d00c2a9e5708dc89a3f4b29856f367"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.4/acm_0.1.4_linux_arm64.tar.gz"
      sha256 "d1c0d5c043f6173b27ef6a74183d1619fffa212aa7d8909e051774eced06b24f"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.4/acm_0.1.4_linux_amd64.tar.gz"
      sha256 "8454f0cad5285df8f142dbea289afb0289d0821933b99925e0da9e22a88095f6"
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
