class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.10/safeselect-v0.7.10-aarch64-apple-darwin.tar.gz"
    sha256 "4ac7ab1f3b7313914aa0d72defd149218730b1d24d6a1404b98be72400aab929"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.10/safeselect-v0.7.10-x86_64-apple-darwin.tar.gz"
    sha256 "da80fbcce87b1ae27905fe5c3093bf7d913887af0db1f3ea011d1c3d8e45b446"
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
