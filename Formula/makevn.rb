class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.4.0/makevn-v0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "c2ff417d2c34a8704ef236efccb1aa2f3cf690c242655eaed362649ce16d37cf"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.4.0/makevn-v0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "4d2b171773b644ccde6ca37bbe4c4ba0e9326c98a7becbcdb69266b5c69d8c12"
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
