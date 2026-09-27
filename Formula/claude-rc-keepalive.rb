class ClaudeRcKeepalive < Formula
  desc "Keep claude remote-control sessions attached on macOS"
  homepage "https://github.com/VTAkbay/claude-rc-keepalive"
  url "https://github.com/VTAkbay/claude-rc-keepalive/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "6a3522dc14ddcc00dd44439cf044adef162f772f1645afd3e27bbd7e8576a47e"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"claude-rc-keepalive"
  end

  def caveats
    <<~EOS
      Set it up for the folder your remote-control sessions should start in:
        claude-rc-keepalive install --dir ~/code

      It needs the native Claude Code install, that folder trusted in Claude Code
      (run `claude` there once), and `claude remote-control` run once in a
      terminal with "y" answered. Check it any time with:
        claude-rc-keepalive status

      After `brew upgrade claude-rc-keepalive`, run the install command again.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/claude-rc-keepalive --version").strip
    assert_match "claude-rc-keepalive install", shell_output("#{bin}/claude-rc-keepalive help")
  end
end
