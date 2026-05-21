class NimbusSetup < Formula
  desc "Génère un QR Code de configuration pour l'app iOS Nimbus"
  homepage "https://github.com/nimbusterminal/homebrew-nimbus"
  url "https://github.com/nimbusterminal/homebrew-nimbus/releases/download/v1.0.0/nimbus-setup-1.0.0.tar.gz"
  sha256 "d46e36f2b8889887cad56e8a4518d2fdffb8433057ffef9f1ebebd92b03b5ba0"
  license "MIT"
  version "1.0.0"

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
