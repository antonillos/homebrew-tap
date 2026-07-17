class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.1/safeselect-v0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "2980d74355cc410b55c3dd955258c57a4ea5935ff08186ae315e07d366007a3f"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.1/safeselect-v0.6.1-x86_64-apple-darwin.tar.gz"
    sha256 "e757b3ceb436247adaac2275efce34dba8988dfebc0f5b4787ee08c01968943a"
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
