class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.5.0/makevn-v0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "c018b0bb13f5c2bd62191f222c281371f0044c9da8025c259b9248d5dcd95f9f"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.5.0/makevn-v0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "b10bd28f54395072a4f7b02200081253cb61cce1d7fbb41e40d104971c179417"
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
