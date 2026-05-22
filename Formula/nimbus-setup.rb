class NimbusSetup < Formula
  desc "Génère un QR Code de configuration pour l'app iOS Nimbus"
  homepage "https://github.com/nimbusterminal/homebrew-nimbus"
  url "https://github.com/nimbusterminal/homebrew-nimbus/releases/download/v1.0.5/nimbus-setup-1.0.5.tar.gz"
  sha256 "1cc9adaaa4cb0c97948518fdedce013c9916ca45b63108f933d0acd21d80d2f7"
  license "MIT"
  version "1.0.5"

  depends_on "python@3.14"

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"
    system python, "-m", "venv", libexec
    # Installe le paquet + ses dépendances depuis les wheels embarqués (hors-ligne).
    system libexec/"bin/pip", "install", "--no-index",
           "--find-links=#{buildpath}", "nimbus-setup"
    bin.install_symlink libexec/"bin/nimbus-setup"
  end

  test do
    assert_match "Nimbus", shell_output("#{bin}/nimbus-setup --help")
  end
end
