class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.3.0/makevn-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "10cb0ed4632c3c9a3e7c3d4573065d3e8ee6dffaf558f3baa5dfe961d9ce3479"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.3.0/makevn-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "0c8ed99af2c942c0b068759af4205258fd17047cce787f5c8205615c9964077c"
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
