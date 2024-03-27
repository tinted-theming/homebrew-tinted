class Tinty < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  url "https://api.github.com/repos/tinted-theming/tinted-builder-rust/tarball/v0.2.2"
  sha256 "d60e83814dd286fc523a55a4f26bae13a16fc714f7557eec8aaee160a9da50d4"
  license "GPL-3.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "tinted-builder-rust #{version}", shell_output("#{bin}/tinted-builder-rust --version")
  end
end
