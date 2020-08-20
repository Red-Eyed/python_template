"""
This script unites all .env.* file into .env.all
"""

__author__ = "Vadym Stupakov"
__email__ = "vadim.stupakov@gmail.com"

from pathlib import Path

CURRENT_DIR = Path(__file__).parent

ENV_GLOBAL = CURRENT_DIR / ".env.all"

content = ""
for f in CURRENT_DIR.glob(".env*"):
    if f.name in (".env.secrets.enc", ".env.all"):
        continue
    content += f.read_text()

ENV_GLOBAL.write_text(content)
