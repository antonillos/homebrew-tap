class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.6.0/makevn-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "f4038e6a2b1a4a2df7eb73238a273cc36f615cffa5bf8163fcb0a5a4e167b7f5"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.6.0/makevn-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "e57f64c996d75b566d6acb1a94230f1fcd367bcebc68e2d577ae9e31a5340558"
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
