class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.1/safeselect-v0.7.1-aarch64-apple-darwin.tar.gz"
    sha256 "01abdc8156eb873523b6a8702fc0035c1bb2ff705f8e3e3aa39ff64bb2a9ccd6"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.1/safeselect-v0.7.1-x86_64-apple-darwin.tar.gz"
    sha256 "f839758bf134b9296786de9f2eef168736cd38ae8926b9a33730ef815655d1a8"
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
