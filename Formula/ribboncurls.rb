class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  url "https://api.github.com/repos/tinted-theming/ribboncurls/tarball/v0.3.0"
  sha256 "503265ac34bbec6cd6390b68d7fa1f1ebd7ef7b827a8d2795aed72ca0ed8982c"
  license "APACHE or MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "ribboncurls-cli"
  end

  test do
    assert_match "ribboncurls #{version}", shell_output("#{bin}/ribboncurls --version")
  end
end
