class Tinty < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/builder-rust"
  url "https://api.github.com/repos/tinted-theming/builder-rust/tarball/v0.1.0"
  sha256 "6f771804da5e06e3c10de14391c22e5b1cb46ccbc8b28e7bd8ece4866b665fb8"
  license "GPL-3.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "builder-rust #{version}", shell_output("#{bin}/builder-rust --version")
  end
end
