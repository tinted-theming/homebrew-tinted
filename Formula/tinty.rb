class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  url "https://api.github.com/repos/tinted-theming/tinty/tarball/v0.10.1"
  sha256 "40bd4f440ae017b2ebba973e5a97ce66a4c472101a0d1bcd7d759723e6351cdb"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinty #{version}", shell_output("#{bin}/tinty --version")
  end
end
