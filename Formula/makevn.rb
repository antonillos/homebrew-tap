class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.14/makevn-v0.1.14-aarch64-apple-darwin.tar.gz"
    sha256 "e0ee9827e3c086719bf950e2395a25d0385b7f75ce390ce6957324406184f591"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.14/makevn-v0.1.14-x86_64-apple-darwin.tar.gz"
    sha256 "f3f29293d45149473a8eb62b6b51274a80aeb990c1e194e84ddf19562e891f1f"
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
