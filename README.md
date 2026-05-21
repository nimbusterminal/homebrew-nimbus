# homebrew-nimbus

Tap [Homebrew](https://brew.sh) pour **nimbus-setup** — l'assistant en ligne de
commande qui génère un QR Code de configuration pour l'app iOS **Nimbus**
(terminal SSH optimisé pour Claude Code).

## Installation

```bash
brew install nimbusterminal/nimbus/nimbus-setup
```

Cette commande ajoute automatiquement le tap puis installe l'outil. Ensuite :

```bash
nimbus-setup
```

L'assistant détecte (ou crée) ta clé SSH, te pose quelques questions, puis affiche
un QR Code à scanner depuis l'app iOS Nimbus.

## Mise à jour

```bash
brew update && brew upgrade nimbus-setup
```

## Licence

MIT
