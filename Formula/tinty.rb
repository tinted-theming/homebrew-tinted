class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  url "https://api.github.com/repos/tinted-theming/tinty/tarball/v0.17.0"
  sha256 "e4b7eb0688f4440b089ad5a91aa7242a499f8dc17ddcdd2d4862b29a58408d74"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinty #{version}", shell_output("#{bin}/tinty --version")
  end
end
