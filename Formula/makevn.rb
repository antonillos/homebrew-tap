class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.2/makevn-v0.1.2-aarch64-apple-darwin.tar.gz"
    sha256 "aba9fcccc201700874b8d948f0b0e94fa028d2454b3ebd91770f96157ea7017e"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.2/makevn-v0.1.2-x86_64-apple-darwin.tar.gz"
    sha256 "705a0edb0fe95f3c17ac480e28d4d5263794479069de357e5cb7a49d511619b0"
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
