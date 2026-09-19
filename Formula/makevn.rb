class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.11/makevn-v0.1.11-aarch64-apple-darwin.tar.gz"
    sha256 "8f8cb140f59c28062d4042d22a3858c1532ec27301f140e3435188d36980451f"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.11/makevn-v0.1.11-x86_64-apple-darwin.tar.gz"
    sha256 "df04e25a102e72668e9c5af580e327269be2804098f9009fd6a33c682b14bb6f"
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
