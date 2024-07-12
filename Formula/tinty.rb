class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  url "https://api.github.com/repos/tinted-theming/tinty/tarball/v0.18.0"
  sha256 "62581f1f87db804985f1d54143ea287f889b76b830233516416730660abdf6c7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinty #{version}", shell_output("#{bin}/tinty --version")
  end
end
