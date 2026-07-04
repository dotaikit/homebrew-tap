class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.16/acm_0.1.16_darwin_arm64.tar.gz"
      sha256 "6d92be875180703ef3783c3b9c5cfde645989fc0941c5f6974d764979fc1b862"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.16/acm_0.1.16_darwin_amd64.tar.gz"
      sha256 "014325dcdaeabb840cac49291892ee3b89e066cc25a02c4128e49801bad307fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.16/acm_0.1.16_linux_arm64.tar.gz"
      sha256 "534f17a6bb0f55b685b1922501b3b4b41067809e044cdf956e7846649140f38d"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.16/acm_0.1.16_linux_amd64.tar.gz"
      sha256 "950391a43d8a0ee2b8fcf8bdbcce5a18ed1291718856a6805bf22609182d7440"
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
