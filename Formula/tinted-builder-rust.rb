class Tinty < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  url "https://api.github.com/repos/tinted-theming/tinted-builder-rust/tarball/v0.4.0"
  sha256 "98ac33e2beca690cd86fbed30d0b80fba480e9a4430cae440ab32d83105676e9"
  license "GPL-3.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinted-builder-rust #{version}", shell_output("#{bin}/tinted-builder-rust --version")
  end
end
