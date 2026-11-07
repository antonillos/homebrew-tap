class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.8.0/safeselect-v0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "af7d2df308546a579235d10afd9cb5464401c70af9e9654bcd2fa4f3155c69f6"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.8.0/safeselect-v0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "75703cb48f863e7afc320d384cd17959789ad72e0c26f971855b664c5c6aecf8"
  end

  def install
    bin.install "safeselect"
  end

  def caveats
    <<~EOS
      Requires Java 17+ for database commands.

      Get started: https://github.com/antonillos/safeselect#quick-start
      CLI help:    safeselect --help
    EOS
  end

  test do
    assert_match "safeselect #{version}", shell_output("\#{bin}/safeselect --version")
  end
end
