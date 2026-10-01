class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.13/makevn-v0.1.13-aarch64-apple-darwin.tar.gz"
    sha256 "0b94e978a354ea429b81e99b6a2d31f02677e3e7305869a4e378d3648b51f2fc"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.13/makevn-v0.1.13-x86_64-apple-darwin.tar.gz"
    sha256 "c1e75d62ea95fc3378fb708d4144b5abd8c6418d508bb37a179c396e13438d08"
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
