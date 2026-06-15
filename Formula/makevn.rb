class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.8/makevn-v0.1.8-aarch64-apple-darwin.tar.gz"
    sha256 "d3706b8bc7353646da4eed963c30afc4fea9d48405764e7b67a772e2d0d67833"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.8/makevn-v0.1.8-x86_64-apple-darwin.tar.gz"
    sha256 "a819f34f803f010eaec0a36b3705483a2ea92e3b86f40fa49723f5d08e3d7a42"
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
