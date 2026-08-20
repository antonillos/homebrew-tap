class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.2/safeselect-v0.7.2-aarch64-apple-darwin.tar.gz"
    sha256 "d333236af6cad6e07d15e58be0650a416076e59cf7c55319c791703ecff600d6"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.2/safeselect-v0.7.2-x86_64-apple-darwin.tar.gz"
    sha256 "6221d65bcec0e49f18781f3712cae84c689e8c4dd5892364e2825b5d9f596dfb"
  end

  def install
    bin.install "safeselect"
  end

  def caveats
    <<~EOS
      SafeSelect has been installed. To get started:

        safeselect --help

      SafeSelect requires Java 17 or newer at runtime. If needed, install it with:

        brew install openjdk@17

      PostgreSQL requires a JDBC driver. Download it with:

        safeselect driver download --vendor postgresql

      For MCP (Model Context Protocol) support, install the integration:

        safeselect agent install opencode --environment <env> --name <name>

      (Run from your project repo — .safeselect/ is auto-detected.)
    EOS
  end

  test do
    assert_match "safeselect #{version}", shell_output("\#{bin}/safeselect --version")
  end
end
