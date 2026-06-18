class Safeselect < Formula
  desc "MCP SQL Fail-Closed for AI Agents"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.3.0/safeselect-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "c1328f6fba7f8efc189e61a4615363efb5d6524bf289c8482e95ba496a81877f"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.3.0/safeselect-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "3ed5eefb01c2e406e09beb5da36274934cbb645a51523967ce547267e2e24e73"
  end

  depends_on "openjdk@17"

  def install
    bin.install "safeselect"
  end

  def caveats
    <<~EOS
      SafeSelect has been installed. To get started:

        safeselect --help

      A JDBC driver is required. Download the PostgreSQL driver:

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
