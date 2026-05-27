class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.4/makevn-v0.1.4-aarch64-apple-darwin.tar.gz"
    sha256 "e2bbcef44a7c48832f8418eb639f6f8a78d4e67a63e5856251a331956607f793"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.4/makevn-v0.1.4-x86_64-apple-darwin.tar.gz"
    sha256 "1344b66f3a750e41154d067399dcfa1fa290d4380f7586035d8f1e7a2d15e67b"
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
