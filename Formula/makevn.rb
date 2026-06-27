class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.9/makevn-v0.1.9-aarch64-apple-darwin.tar.gz"
    sha256 "28a0a381979c04c1bb2d61e54f9724cd85e452d13df3d06eead81d40742933d8"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.9/makevn-v0.1.9-x86_64-apple-darwin.tar.gz"
    sha256 "e384e5c2384df46462ae0841a81563a8dd1a4a9c934cd59ea317c02ee6881842"
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
