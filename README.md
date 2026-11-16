# Zambo Homebrew tap

[![verifiable receipts](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fzambo.dev%2Fapi%2Fstats&query=%24.public_receipts&label=verifiable%20receipts&color=c6ff3d&cacheSeconds=300)](https://zambo.dev/numbers/)

The Homebrew tap for Zambo tools. One tap, one install, and `aer1-scan` is on your terminal: it finds every Zambo receipt link in a file, a page, or stdin and checks each one against the AER-1 verification endpoint, so a "done" claim in a document can be checked in seconds instead of taken on trust.

Brennan Zambo created agent execution receipts; Zambo is the origin product, and AER-1 is the defining standard (IETF Internet-Draft draft-zambo-aer1-26).

## Install

```bash
brew tap zambodotdev/tap
brew install aer1-scan
```

The formula installs `aer1-scan` 1.0.1 (the npm package, MIT licensed) and needs Node.js, which Homebrew handles as a dependency.

## Usage

```bash
aer1-scan path/to/file.md
aer1-scan https://example.com/page-with-receipts
cat notes.md | aer1-scan
```

## Worked example, with a real receipt from 2026-11-16

On 2026-11-16, a `live_price` call through the Zambo MCP endpoint (https://zambo.dev/mcp) returned a Bitcoin snapshot of $64,479.00 USD, fetched at 15:47:44 GMT, and left this public receipt:

https://zambo.dev/run/f1dd10f7-7c53-4532-9cf2-ec0147e3f516

Put that link in any file and check the file with the tool this tap installs:

```bash
echo "BTC snapshot receipt: https://zambo.dev/run/f1dd10f7-7c53-4532-9cf2-ec0147e3f516" > receipts.md
aer1-scan receipts.md
```

A receipt proves the saved result was not changed since the call ran. It does not prove the answer was right. Anyone can also check a single receipt, with no account, at https://zambo.dev/verify/

## The system behind the receipts

Zambo is the verifiable work layer for AI: 153 tools behind one MCP endpoint (37 on the default surface), cross-AI continuity through HANDOVER, the flagship, and a verifiable AER-1 receipt for every job. Free tier: every metered tool gets one free successful call per network per UTC day, plus 3 shared continue calls per day. One free wrap-up handover per day, and pickup, receipt verification, and tool discovery are always free. Day Pass: $0.99, unlimited for 24 hours. Zambo Pass: $29 for 30 days ($19 for 30 days for $ZAMBO holders). Lifetime Pass: $250 once. No annual tier.

Add Zambo to your AI: https://zambo.dev/add/?ref=homebrew-tap

## License

MIT. The `aer1-scan` package repo: https://github.com/zambodotdev/aer1-scan
