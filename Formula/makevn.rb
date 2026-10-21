class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.2.1/makevn-v0.2.1-aarch64-apple-darwin.tar.gz"
    sha256 "56363a58735c512217d3d4d6ae9cfab34ac168f51515b7f1ed5cf14741cdb681"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.2.1/makevn-v0.2.1-x86_64-apple-darwin.tar.gz"
    sha256 "9d81fb7f43cf92fff051e2ff5d3fb030f6452ff625cf3eb47aac1b5f0b02328b"
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
