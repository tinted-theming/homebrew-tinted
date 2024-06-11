class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  url "https://api.github.com/repos/tinted-theming/ribboncurls/tarball/cli-v0.2.0"
  sha256 "815d2ac22182b953d6af9a6662d4cf9c73d954671f2c574f8287b5fc898e6211"
  license "APACHE or MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", ".", "--bin", "ribboncurls"
  end

  test do
    assert_match "ribboncurls #{version}", shell_output("#{bin}/ribboncurls --version")
  end
end
