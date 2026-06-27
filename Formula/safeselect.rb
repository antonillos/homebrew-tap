class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.5.1/safeselect-v0.5.1-aarch64-apple-darwin.tar.gz"
    sha256 "f3e1114ed5ce271a6a1985ea70192516be736527d1ad3245a81cd1ce388c3b8c"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.5.1/safeselect-v0.5.1-x86_64-apple-darwin.tar.gz"
    sha256 "6a255187ae4bc20d4eaa6b06d330a6372220fd735dc73ade7ae582eee7b72377"
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
