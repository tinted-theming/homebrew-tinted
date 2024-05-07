class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  url "https://api.github.com/repos/tinted-theming/tinty/tarball/v0.13.0"
  sha256 "a9b534385510e68d39a746a078807860864106e1392c51b792b92e9e408a29b6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinty #{version}", shell_output("#{bin}/tinty --version")
  end
end
