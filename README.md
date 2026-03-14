# KoReader → Anki

Transforme automatiquement tes annotations KoReader en cartes Anki **cloze** avec définitions, phonétique, traduction française et audio — grâce à Claude AI.

![Python](https://img.shields.io/badge/Python-3.9+-blue)
![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

---

## Ce que ça fait

1. Tu lis sur ta liseuse, tu soulignes des mots et expressions
2. Tu glisses ton fichier `.lua` dans l'app
3. Claude génère automatiquement pour chaque expression :
   - Une phrase à trou (**cloze**) pour forcer le recall actif
   - Un indice vague pour aider sans trahir la réponse
   - La phonétique IPA
   - La définition en anglais
   - La traduction française
   - L'audio de prononciation
4. Les cartes arrivent directement dans Anki, taguées par livre

---

## Installation (une seule fois)

### Prérequis
- macOS
- Python 3.9+ (`brew install python3` si absent)
- [Anki](https://apps.ankiweb.net/) avec l'add-on **AnkiConnect** (code : `2055492159`)
- Une clé API [Anthropic](https://console.anthropic.com)

### Installer

```bash
git clone https://github.com/TON_USERNAME/koreader-anki.git
cd koreader-anki
bash install.sh
```

C'est tout. Un raccourci **KoReader Anki** apparaît sur ton Bureau.

---

## Utilisation

1. Double-clique sur **KoReader Anki** sur le Bureau
2. Entre ta clé API Anthropic (sauvegardée automatiquement)
3. Branche ta liseuse en USB → copie ton fichier `.lua` sur le Mac
4. Glisse le fichier dans l'app
5. Vérifie que le nom du deck est correct
6. Clique **Générer les cartes**
7. Ouvre Anki — tes cartes sont là

---

## Formats supportés

| Format | Description |
|--------|-------------|
| `.lua` | Fichier metadata KoReader (annotations de livre) |
| `.lua` | `vocabulary_builder.lua` (constructeur de vocabulaire) |
| `.sqlite` | Base de données vocabulary builder |
| `.csv` | Export CSV avec colonne `word` |

---

## Structure des cartes Anki

**Recto** — La phrase avec le mot remplacé par un blanc + un indice vague

**Verso** — Le mot, sa phonétique, sa définition, la phrase complète avec le mot en évidence, la traduction française

---

## Pipeline complet

```
Liseuse (lire + souligner)
    ↓ USB
fichier .lua sur le Mac
    ↓ KoReader Anki app
Claude génère les cartes
    ↓ AnkiConnect
Anki (révision SRS quotidienne)
    ↓ une fois par semaine
Session production sur Claude.ai
```

---

## Licence

MIT
