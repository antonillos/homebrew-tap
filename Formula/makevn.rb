class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.2.0/makevn-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "4f8991e9c1798eb0388e04e383fd58a102f2345fd1f55dc7cfcc38f512c8b957"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.2.0/makevn-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "d8a51caf1c8dffebbc517e8d27b93c2eb75818f94828ae83528b5e8102e060c1"
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
