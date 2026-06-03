class NimbusSetup < Formula
  desc "Génère un QR Code de configuration pour l'app iOS Nimbus"
  homepage "https://github.com/nimbusterminal/homebrew-nimbus"
  url "https://github.com/nimbusterminal/homebrew-nimbus/releases/download/v1.0.10/nimbus-setup-1.0.10.tar.gz"
  sha256 "82d6e5a9dfa800183d1e5804c2189473d7b19ceb12024d9f8f6c826ed60cf030"
  license "MIT"
  version "1.0.10"

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
