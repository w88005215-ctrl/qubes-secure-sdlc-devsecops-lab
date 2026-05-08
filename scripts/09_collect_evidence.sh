#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

mkdir -p evidence/command_outputs

if ! command -v tree >/dev/null 2>&1; then
  echo "[ERROR] tree is not installed."
  echo "[INFO] Install tree in the TemplateVM used by this AppVM, then restart the AppVM."
  exit 1
fi

echo "[INFO] Collecting project tree..."

rm -f PROJECT_TREE.txt
rm -f evidence/command_outputs/DEVSECOPS_99_OUTPUT_project_tree_final.txt

tree -a -I '.git|__pycache__|.venv|venv|*.pyc|*.log' . \
  | tee PROJECT_TREE.txt

cp PROJECT_TREE.txt evidence/command_outputs/DEVSECOPS_99_OUTPUT_project_tree_final.txt

if ! test -s PROJECT_TREE.txt; then
  echo "[ERROR] PROJECT_TREE.txt is empty."
  exit 1
fi

if ! test -s evidence/command_outputs/DEVSECOPS_99_OUTPUT_project_tree_final.txt; then
  echo "[ERROR] final tree evidence is empty."
  exit 1
fi

echo "[INFO] Collecting git status..."
git status --short \
  | tee evidence/command_outputs/DEVSECOPS_99_OUTPUT_git_status.txt

echo "[INFO] Collecting git log..."
git log --oneline --decorate -n 20 \
  | tee evidence/command_outputs/DEVSECOPS_99_OUTPUT_git_log.txt

echo "[INFO] Building SHA256 evidence inventory..."

{
  echo "# Evidence Inventory / Инвентаризация evidence"
  echo
  echo "| File | SHA256 |"
  echo "|---|---|"
  find evidence -type f \
    ! -path '*/.gitkeep' \
    ! -name 'EVIDENCE_INVENTORY.md' \
    -print0 | sort -z | while IFS= read -r -d '' file; do
      sha256="$(sha256sum "$file" | awk '{print $1}')"
      echo "| $file | $sha256 |"
    done
} > evidence/EVIDENCE_INVENTORY.md

if ! test -s evidence/EVIDENCE_INVENTORY.md; then
  echo "[ERROR] evidence inventory is empty."
  exit 1
fi

echo "[OK] Evidence collection completed."
