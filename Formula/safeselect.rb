class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.7/safeselect-v0.7.7-aarch64-apple-darwin.tar.gz"
    sha256 "e5894ef90b1e3c29b61136c06eb033cd4ab22e72bb82890668074c3e791aef0d"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.7/safeselect-v0.7.7-x86_64-apple-darwin.tar.gz"
    sha256 "b5c4b577dfbf3f1cd728bf7110fd4560631558b3a7b144826e9ba8f00f3eca07"
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
