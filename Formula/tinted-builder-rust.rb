class Tinty < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  url "https://api.github.com/repos/tinted-theming/tinted-builder-rust/tarball/v0.5.0"
  sha256 "1195d10208bdb18f780b98c551a22d02d1f37a8ef02b156ee2f73dce0ff254ad"
  license "GPL-3.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinted-builder-rust #{version}", shell_output("#{bin}/tinted-builder-rust --version")
  end
end
