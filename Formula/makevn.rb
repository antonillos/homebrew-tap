class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.10/makevn-v0.1.10-aarch64-apple-darwin.tar.gz"
    sha256 "cd256382452764d8ff48589cf57f24e496cdd571418c6dae96ea38be628eb1e4"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.10/makevn-v0.1.10-x86_64-apple-darwin.tar.gz"
    sha256 "174a1be71018fa9b551a5546c1f4c0312b8276660113f8355cd37f57504c734d"
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
