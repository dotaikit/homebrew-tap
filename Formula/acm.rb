class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.2/acm_0.1.2_darwin_arm64.tar.gz"
      sha256 "ee6c0691a0442bded160cd63a57833d2164e36a5497e1dc2b7917730ab383030"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.2/acm_0.1.2_darwin_amd64.tar.gz"
      sha256 "1212fbfc9dbd27296185730380d0a84537a792326585b4cd5aeef9acd0c896e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.2/acm_0.1.2_linux_arm64.tar.gz"
      sha256 "3f1cbf26b3e7fb60d9cde2c82edf68780c83f7b2ce82081bcd0e29ad2f96e850"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.2/acm_0.1.2_linux_amd64.tar.gz"
      sha256 "f9884b4785b92b40d0798864fbfa9813fce9e179cea56da118c3e717274278ca"
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
