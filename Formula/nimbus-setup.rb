class NimbusSetup < Formula
  desc "QR Code de configuration + commande nimbus pour partage Mac/iPhone des sessions Claude"
  homepage "https://github.com/nimbusterminal/homebrew-nimbus"
  url "https://github.com/nimbusterminal/homebrew-nimbus/releases/download/v1.2.7/nimbus-setup-1.2.7.tar.gz"
  sha256 "a9d7542f1fc33f2136c1bd6c93cc64d69c8f50b82e82f4a475785d99930f7f29"
  license "MIT"
  version "1.2.7"

  depends_on "python@3.14"
  # dtach est utilisé par `nimbus claude` / `nimbus attach` pour partager les
  # sessions Claude entre Mac et iPhone (mêmes processus, plusieurs écrans).
  depends_on "dtach"

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"
    system python, "-m", "venv", libexec
    # Installe le paquet + ses dépendances depuis les wheels embarqués (hors-ligne).
    system libexec/"bin/pip", "install", "--no-index",
           "--find-links=#{buildpath}", "nimbus-setup"
    # Deux entry points : nimbus-setup (QR config) et nimbus (wrapper Claude).
    bin.install_symlink libexec/"bin/nimbus-setup"
    bin.install_symlink libexec/"bin/nimbus"
  end

  test do
    assert_match "Nimbus", shell_output("#{bin}/nimbus-setup --help")
    assert_match "nimbus", shell_output("#{bin}/nimbus --help")
  end
end
