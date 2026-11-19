"""
CTL collector skeleton.
Default behavior is intentionally safe: no fabricated market data is inserted.
Configure Supabase credentials as GitHub repository secrets:
SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY.
Add source-specific adapters only after confirming each API's terms and schema.
"""
import os, sys
from datetime import datetime, timezone

def main():
    url = os.getenv("SUPABASE_URL")
    key = os.getenv("SUPABASE_SERVICE_ROLE_KEY")
    if not url or not key:
        print("Missing Supabase secrets; no collection performed.")
        sys.exit(0)
    print("CTL collector ready:", datetime.now(timezone.utc).isoformat())
    print("No source adapters configured yet; no values inserted.")

if __name__ == "__main__":
    main()
