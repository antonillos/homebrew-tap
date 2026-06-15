class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.7/makevn-v0.1.7-aarch64-apple-darwin.tar.gz"
    sha256 "c8dd0662dde5802f97355be67ace7fabd0a2454660709e087b836ff324fdcb0f"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.7/makevn-v0.1.7-x86_64-apple-darwin.tar.gz"
    sha256 "afa275c04b42bd848bbc3b37aa15db203f37c5b0e300d46a624a9a81d1a61447"
  end

  def install
    bin.install "bin/makevn"
    bin.install "bin/makevn-mcp"
    libexec.install "libexec/makevn"
    share.install "share/makevn"
  end

  def caveats
    <<~EOS
      makevn has been installed. To get started:

        makevn --help

      For MCP (Model Context Protocol) support, add to your client config:

      {
        "mcpServers": {
          "makevn": {
            "command": "#{HOMEBREW_PREFIX}/bin/makevn-mcp"
          }
        }
      }
    EOS
  end

  test do
    assert_match "makevn", shell_output("#{bin}/makevn --help")
    assert_path_exists bin/"makevn-mcp"
  end
end
