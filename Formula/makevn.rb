class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.7.0/makevn-v0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "982cb77acf05d8ec072908beee55752cf5f0cec411b8a657bb815a4155be4887"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.7.0/makevn-v0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "4433bbfb5f157111fe4c0b73541b4cfb0a596bc1c0ce15ac0bf2a411006a7755"
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
