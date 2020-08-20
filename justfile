# Encrypt
encrypt file=".env.secrets":
    age -p -o {{file}}.enc {{file}}

# Decrypt
decrypt file=".env.secrets.enc":
    age -d -o {{replace(file, ".enc", "")}} {{file}}

# run code checks
check:
    uv run ruff format .
    uv run ruff check --fix .
    uv run pyrefly check .

# Untite all .env* files into .env.all
unite-envfiles:
    uv run merge_env.py

