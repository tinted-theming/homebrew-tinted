class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  url "https://api.github.com/repos/tinted-theming/ribboncurls/tarball/v0.2.1"
  sha256 "692e564d0f73251a93d75e3b37297e0967a0c9ec7c72847ffaddf6bd81834522"
  license "APACHE or MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "ribboncurls-cli"
  end

  test do
    assert_match "ribboncurls #{version}", shell_output("#{bin}/ribboncurls --version")
  end
end
