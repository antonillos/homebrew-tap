class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.3/safeselect-v0.7.3-aarch64-apple-darwin.tar.gz"
    sha256 "d9ffc2839f6240257be3d3dad8c482ee9dbded18a932a9c63f9f4d5532eb6b3f"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.3/safeselect-v0.7.3-x86_64-apple-darwin.tar.gz"
    sha256 "d5d0c00d147ba4cc3236a557c45711a2dcf4f0d3f344cfe39e42816e2b21eac0"
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
