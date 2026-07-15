class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.0/safeselect-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "fed872d1c5c7966f3a0b3b6f62675243d0ea5d35cea135ca5b497d41bf616b49"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.0/safeselect-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "0b88d4cd812785003f0dbf36c38229be727934edd456c2eea2ec650b73a3c771"
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
