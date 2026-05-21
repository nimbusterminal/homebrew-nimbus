class NimbusSetup < Formula
  desc "Génère un QR Code de configuration pour l'app iOS Nimbus"
  homepage "https://github.com/nimbusterminal/homebrew-nimbus"
  url "https://github.com/nimbusterminal/homebrew-nimbus/releases/download/v1.0.3/nimbus-setup-1.0.3.tar.gz"
  sha256 "345a3175adaf1f7d81f5f6061e05475b2118f47287c87dc0af08c973819e55f1"
  license "MIT"
  version "1.0.3"

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
