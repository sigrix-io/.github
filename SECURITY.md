# Security Policy

This policy covers the Sigrix marketplace at [sigrix.io](https://sigrix.io) and
everything published under the [`sigrix-io`](https://github.com/sigrix-io)
organisation.

## Reporting a vulnerability

Please report suspected vulnerabilities **privately** — do not open a public
issue, post details in a discussion, or disclose them publicly before we have
had a chance to fix them.

Preferred channel:

- **GitHub private vulnerability reporting** — use
  ["Report a vulnerability"](https://github.com/sigrix-io/.github/security/advisories/new).
  Reports go only to the maintainers and can be discussed and fixed privately
  before any disclosure.

If you cannot use GitHub:

- Email **support@sigrix.io** with the subject line `SECURITY:` followed by a
  short summary. Include enough detail to reproduce the issue (affected URL or
  endpoint, steps, impact). Please do not attach working exploits.

What to expect:

- Acknowledgement within **3 business days**.
- A triage verdict (accepted / duplicate / not a vulnerability) and, for
  accepted reports, a remediation plan within **14 days**.
- Credit in the fix's release notes if you would like it — tell us how to
  attribute you.

## Scope

In scope:

- The production marketplace at `sigrix.io` and its subdomains.
- Any public repository under the `sigrix-io` organisation.
- Secrets accidentally committed to a public `sigrix-io` repository.

Out of scope:

- **Stripe.** Payment flows are handled by Stripe; vulnerabilities in Stripe
  itself go to [Stripe's disclosure program](https://stripe.com/docs/security).
- Findings from automated scanners with no demonstrated impact, missing
  hardening headers with no exploit path, and reports that amount to a
  configuration preference rather than a vulnerability.
- Social engineering of our staff, sellers or buyers.

## Ground rules for testing

The Sigrix platform is closed-source, so there is no public checkout to test
against. That means any testing happens against a live system holding real user
and payment data, and we ask you to keep it careful and minimal:

- **Use your own account and your own test data.** Do not access, modify or
  retain data belonging to another user. If you access someone else's data
  accidentally, stop, and tell us what you saw in the report.
- **No denial-of-service**, load testing, or automated scanning that generates
  significant traffic.
- **No spam or social engineering** of staff, sellers or buyers.
- **Do not exfiltrate data.** A single screenshot or a record count is enough to
  prove impact — do not download datasets.
- **Do not place real orders** to test payment flows without telling us first.

We will not pursue action against researchers who follow this policy in good
faith, report promptly, and give us reasonable time to fix an issue before
disclosing it. This is not a legal safe-harbour guarantee; if you want one in
writing before you start, email us and ask.

We do not currently run a paid bug bounty.

## Supported versions

The platform is deployed continuously; there are no maintained release
branches. Only what is currently in production receives security fixes.
