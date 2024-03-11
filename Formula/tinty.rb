class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  url "https://api.github.com/repos/tinted-theming/tinty/tarball/v0.11.0"
  sha256 "8fe68492195b03aafd7740ba2e0dd1d8cd811c3fd3598aac09bda8ae2549276d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinty #{version}", shell_output("#{bin}/tinty --version")
  end
end
