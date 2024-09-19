class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  license "APACHE-2.0 OR MIT"
  version "0.4.1"

  on_macos do
    url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.1/ribboncurls-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "2bb7969ec0c36900e5e814766564e5b120266c3dcf73370eaee654bd1c6f87f8" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.1/ribboncurls-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "ac8f41dced555c8a4aaf8d0a809a2e7bec9ab4b89612171b04b87be6e544fb88" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.1/ribboncurls-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "b7e19fc8185d86bb1d0aacaf50b391f6e81bac76c0ca832b4ea8b7f8943e0104" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.1/ribboncurls-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "261281c0f3b40d51e9accd3bca56d07fd095f973f0279efee18c76c5d553f4cd" # aarch64-unknown-linux-gnu
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
