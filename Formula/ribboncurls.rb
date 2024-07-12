class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  license "APACHE-2.0 OR MIT"
  version ""

  on_macos do
    url "" # universal-apple-darwin
    sha256 "" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "" # x86_64-unknown-linux-gnu
        sha256 "" # x86_64-unknown-linux-gnu
      else
        url "" # i686-unknown-linux-gnu
        sha256 "" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "" # aarch64-unknown-linux-gnu
      sha256 "" # aarch64-unknown-linux-gnu
    end
  end

  def install
    if OS.mac? || (OS.linux? && (Hardware::CPU.intel? || (Hardware::CPU.arm? && Hardware::CPU.is_64_bit?)))
      bin.install "ribboncurls"
    else
      system "cargo", "install", "--locked", "--root", prefix, "--path", "ribboncurls-cli"
    end
  end

  test do
    assert_match "ribboncurls #{version}", shell_output("#{bin}/ribboncurls --version")
  end
end
