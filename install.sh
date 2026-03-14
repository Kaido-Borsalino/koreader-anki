#!/bin/bash
# KoReader → Anki  |  Installer
# ==============================
# Lance ce script une seule fois. Il installe tout et crée
# un raccourci "KoReader Anki" sur ton Bureau.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/.venv"
APP_PY="$SCRIPT_DIR/app.py"
SHORTCUT="$HOME/Desktop/KoReader Anki.command"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  KoReader → Anki  |  Installation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 1. Vérifie Python
if ! command -v python3 &>/dev/null; then
  echo "❌  Python 3 non trouvé."
  echo "   Installe-le avec : brew install python3"
  exit 1
fi
echo "✓  Python : $(python3 --version)"

# 2. Crée le venv
echo ""
echo "→  Création de l'environnement virtuel..."
python3 -m venv "$VENV_DIR"
echo "✓  Environnement créé"

# 3. Installe les dépendances
echo ""
echo "→  Installation des dépendances..."
"$VENV_DIR/bin/pip" install --upgrade pip -q
"$VENV_DIR/bin/pip" install -r "$SCRIPT_DIR/requirements.txt" -q
echo "✓  Dépendances installées"

# 4. Crée le raccourci Bureau
echo ""
echo "→  Création du raccourci sur le Bureau..."
cat > "$SHORTCUT" << EOF
#!/bin/bash
source "$VENV_DIR/bin/activate"
python3 "$APP_PY"
EOF
chmod +x "$SHORTCUT"
echo "✓  Raccourci créé : ~/Desktop/KoReader Anki.command"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✅  Installation terminée !"
echo ""
echo "  Double-clique sur 'KoReader Anki'"
echo "  sur ton Bureau pour lancer l'app."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 5. Lance l'app directement
source "$VENV_DIR/bin/activate"
python3 "$APP_PY"
