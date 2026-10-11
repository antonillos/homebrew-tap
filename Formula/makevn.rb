class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.16/makevn-v0.1.16-aarch64-apple-darwin.tar.gz"
    sha256 "c52e39a4a24f695a3dc26f2bae713e4e572cd7703fd29ed9856722cae6feaa90"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.16/makevn-v0.1.16-x86_64-apple-darwin.tar.gz"
    sha256 "9ab673489590e473442d1ec85e7e2a877c7c1488380580e354cc37152adca0e6"
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
