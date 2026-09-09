class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.8/safeselect-v0.7.8-aarch64-apple-darwin.tar.gz"
    sha256 "18e36961c75af7535af5447cb03415662aa24290e47e3751ec59c359e72ce131"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.8/safeselect-v0.7.8-x86_64-apple-darwin.tar.gz"
    sha256 "f0cd57a1fd40fbb3f04f8b22e0dbaf9d1f06e94f8e16147e5650ae59c94d4043"
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
