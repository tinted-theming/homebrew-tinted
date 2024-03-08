class Tinty < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  url "https://api.github.com/repos/tinted-theming/tinted-builder-rust/tarball/v0.1.0"
  sha256 "de44126966bfefe4a2f91d77bf292f42d1d29ed4471cb74ae9e335a9b86a2d6d"
  license "GPL-3.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinted-builder-rust #{version}", shell_output("#{bin}/tinted-builder-rust --version")
  end
end
