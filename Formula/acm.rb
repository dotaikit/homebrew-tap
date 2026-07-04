class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.14/acm_0.1.14_darwin_arm64.tar.gz"
      sha256 "6bcb6fb39a4cd99bedfc689047b93fcc7f6088a3e37b0d9ac8e8d95f44ab21b5"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.14/acm_0.1.14_darwin_amd64.tar.gz"
      sha256 "6e19c73e2de31dc39f00f900b5059642f54bc32e3138e8876d4f2d0e698ff272"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.14/acm_0.1.14_linux_arm64.tar.gz"
      sha256 "401eab1658a5eff3c3ac4c47fa1a7756c2abc1187d41c62abeb13ad1aeb3b87e"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.14/acm_0.1.14_linux_amd64.tar.gz"
      sha256 "30a68adef237e2cba7004eab5fba881e9b16d156b138b0afb9c5eea602bb16d0"
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
