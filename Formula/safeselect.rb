class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.5.2/safeselect-v0.5.2-aarch64-apple-darwin.tar.gz"
    sha256 "d00ae690908d15650aa3d237c3ccf8d3ffbbf7ccd4633aeba71fe3e1643d237e"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.5.2/safeselect-v0.5.2-x86_64-apple-darwin.tar.gz"
    sha256 "d0cab4a79fb83094c8146bc1410ee0c1899cd125aa964ab3d1153f7567d158c9"
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
