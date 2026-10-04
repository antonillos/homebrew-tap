class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.15/makevn-v0.1.15-aarch64-apple-darwin.tar.gz"
    sha256 "fbb2da08589ac2020eebf96690164fbdd6b6a4b3d1afc4213354b8b2e9e9e2a5"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.15/makevn-v0.1.15-x86_64-apple-darwin.tar.gz"
    sha256 "e024766af79d41c1c2f636ffdbe2706afc91e06204f8173bb04ea54eb737e0ce"
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
