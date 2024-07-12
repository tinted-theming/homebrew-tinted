class TintedBuilderRust < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  url "https://api.github.com/repos/tinted-theming/tinted-builder-rust/tarball/v0.9.3"
  sha256 "5c0bc84c4182df9e1e77b2019ea47633cc0d4558877626312603e29926686842"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "tinted-builder-rust"
  end

  test do
    assert_match "tinted-builder-rust #{version}", shell_output("#{bin}/tinted-builder-rust --version")
  end
end
