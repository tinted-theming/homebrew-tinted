class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  license "APACHE-2.0 OR MIT"
  version "0.3.1"

  on_macos do
    url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.3.1/ribboncurls-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "2fe087a725082c0b4e041cddbbfb5652d0182c19907748a3306345fdc805f2ef" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.3.1/ribboncurls-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "f912943b1047757443b9d420cf5bb633af54431f5992bf74836540ea843bca77" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.3.1/ribboncurls-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "0e9b90e616432e4ba8585b4b6eda769323c405ee117d538fbe581c53dc5e1fc2" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.3.1/ribboncurls-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "03c4444a0dbad6dd5fb5d89dfa6f441882203b026e637699cea7f4b3424c51b0" # aarch64-unknown-linux-gnu
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
