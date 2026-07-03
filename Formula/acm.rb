class Acm < Formula
  desc "Agent Config Manager for shell-scoped AI agent profiles"
  homepage "https://github.com/dotaikit/acm"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.1/acm_0.1.1_darwin_arm64.tar.gz"
      sha256 "07678440f420f8664c03a290fb3b1b17de1dafb88d992f276fa47bb2030f5cf0"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.1/acm_0.1.1_darwin_amd64.tar.gz"
      sha256 "84a40af341f8add9c3d867bcd8670daca62b999d5240b1e867e0a549ad9733d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dotaikit/acm/releases/download/v0.1.1/acm_0.1.1_linux_arm64.tar.gz"
      sha256 "8d20196246101fe15043532696074a2f3647fac5ab4075a6871b6b8ca110b517"
    else
      url "https://github.com/dotaikit/acm/releases/download/v0.1.1/acm_0.1.1_linux_amd64.tar.gz"
      sha256 "269fc8af9a2a146655ea0a5af365307453aca7c44f491b439b2ce82349799d08"
    end
  end

  def install
    bin.install Dir["acm_*/acm"].first => "acm"
  end

  test do
    assert_match "acm", shell_output("#{bin}/acm version")
  end
end
