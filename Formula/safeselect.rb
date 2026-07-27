class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.3/safeselect-v0.6.3-aarch64-apple-darwin.tar.gz"
    sha256 "d16f11cbedfec94245ea678c80073af81d1d7a2c17719d65ab93b05cd38f5e55"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.3/safeselect-v0.6.3-x86_64-apple-darwin.tar.gz"
    sha256 "3196d3dc2bd34e6157b7eba09a8de058c9a6a006c0fde6f6aa72a10f72f01691"
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
