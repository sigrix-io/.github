#!/usr/bin/env bash
#
# Installs the Sigrix organisation profile + community health files.
#
# Run this INSIDE the sigrix-io/.github repository — a Codespace on that repo,
# or a local clone of it:
#
#     bash install-profile-files.sh
#
# It writes the files, commits, and pushes to the current branch. It refuses to
# run anywhere other than sigrix-io/.github, so it cannot land in the platform
# repo by accident.

set -euo pipefail

# --- safety: are we in the right repository? -------------------------------
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [ -z "$REPO_ROOT" ]; then
  echo "ERROR: not inside a git repository." >&2
  echo "Open a terminal in the sigrix-io/.github Codespace and re-run." >&2
  exit 1
fi
cd "$REPO_ROOT"

ORIGIN="$(git remote get-url origin 2>/dev/null || echo '(none)')"
case "$ORIGIN" in
  *sigrix-io/.github*) ;;
  *)
    echo "ERROR: refusing to run here." >&2
    echo "  repository root : $REPO_ROOT" >&2
    echo "  origin          : $ORIGIN" >&2
    echo "This script must run inside sigrix-io/.github." >&2
    exit 1
    ;;
esac

echo "==> Repository : $REPO_ROOT"
echo "==> Origin     : $ORIGIN"
echo

# --- write the files -------------------------------------------------------
echo "==> Writing files"
mkdir -p profile

cat > "profile/README.md" <<'SIGRIX_EOF_0'
## The marketplace for vetted AI tools

**Buy an AI agent, prompt, skill, persona or assistant once — then run it in the AI tools you already use.**

Independent creators publish prompts, personas, skills, assistants and agents. We test every listing before it goes live — so the person at the keyboard spends time using AI, not debugging it.

**[Browse the marketplace →](https://sigrix.io/marketplace)**  ·  [Publish a listing](https://sigrix.io/publish)  ·  [Sell on Sigrix](https://sigrix.io/sell)

---

### Five building blocks, from one-line prompt to autonomous agent

A taxonomy that follows complexity. Pick the smallest unit that solves your problem — most people need a prompt, not an agent.

| | |
| --- | --- |
| **[Prompts](https://sigrix.io/marketplace/prompts)** | Single-instruction templates that produce a specific output: a draft, an analysis, a reformat. Drop in, fill the variables, run. |
| **[Personas](https://sigrix.io/marketplace/personas)** | System prompts that give a model a stable role, tone and worldview — so a generic chat surface acts like a senior editor or a tax advisor. |
| **[Skills](https://sigrix.io/marketplace/skills)** | Composable mini-capabilities you bolt onto an existing assistant — a calculator, a citation checker, a tone enforcer. |
| **[Assistants](https://sigrix.io/marketplace/assistants)** | Persona + skills + memory, packaged as a working tool with a defined surface area. Hire one for a job; it stays in scope. |
| **[Agents](https://sigrix.io/marketplace/agents)** | Multi-step systems that plan, call tools and keep going until a goal is met. The most powerful tier — and the one that needs the most scrutiny. |

[How the building blocks fit together →](https://sigrix.io/ai-building-blocks)

### Every listing is tested before it goes live

1. **Creator submits** — with the prompt, the model it was built for, and what it costs to run.
2. **Editorial review** — is it clear, honest, and described the way a buyer would search for it?
3. **Functional test** — we run it. It has to do what the listing says.
4. **Safety + IP check** — no unsafe output, no borrowed work.
5. **Goes live** — published with its verdict visible on the listing.

### What we stand for

- **Verified quality.** Every listing tested before publication.
- **Honest education.** We teach the limits, not just the wins.
- **Creator upside.** Independent makers keep credit and a reduced commission.
- **Fit-based discovery.** Ranking matches the buyer, not the bidder.
- **Transparent surfaces.** Show the prompt, the model, the token cost.

> AI can only go as far as the people using it understand and guide it. Sigrix exists to close that gap — verified components, plain-English documentation, and discovery that matches the buyer instead of the highest bidder.

[Read more about us →](https://sigrix.io/about)  ·  [Meet the team](https://sigrix.io/about/team)  ·  [Learn](https://sigrix.io/learn)  ·  [FAQ](https://sigrix.io/faq)

---

### About this organisation

Sigrix is a commercial marketplace and the platform itself is closed-source, so you won't find the application code here. This organisation hosts our public policies, and over time the things that are genuinely useful to publish — listing specifications, starter templates, and integration examples.

- **Security researchers** — please read our [security policy](https://github.com/sigrix-io/.github/blob/main/SECURITY.md) before testing, and report privately.
- **Buyers and sellers** — product questions, bugs and feature requests belong in the [Sigrix hub](https://sigrix.io/hub), not in GitHub issues.
- **Anything else** — <support@sigrix.io>.

<sub>[sigrix.io](https://sigrix.io) · [LinkedIn](https://www.linkedin.com/company/sigrix) · [Terms](https://sigrix.io/legal/terms-and-conditions) · [Privacy](https://sigrix.io/legal/privacy-policy)</sub>
SIGRIX_EOF_0
echo "    profile/README.md"

cat > "README.md" <<'SIGRIX_EOF_1'
# sigrix-io/.github

This repository holds Sigrix's GitHub organisation profile and the community
health files shared across the organisation. There is no application code here.

| Path | What it does |
| --- | --- |
| `profile/README.md` | Renders as the [organisation profile](https://github.com/sigrix-io). **This file is the public face of Sigrix on GitHub — edit it deliberately.** |
| `SECURITY.md` | How to report a vulnerability. Applies to `sigrix.io` and every public repository in the organisation. |
| `CODE_OF_CONDUCT.md` | Contributor Covenant 2.1. |
| `CONTRIBUTING.md` | How people outside the team can contribute. |

## How the defaults work

GitHub uses the files here as the default for any repository in the organisation
that does **not** carry its own copy. A repository with its own `SECURITY.md`
keeps it; a repository without one shows this one.

That cuts both ways, so two deliberate omissions:

- **No `.github/ISSUE_TEMPLATE/`.** Adding issue templates here would change
  issue creation for every repository in the organisation that has none of its
  own — including the internal platform repository and its existing workflow.
- **No `.github/PULL_REQUEST_TEMPLATE.md`,** for the same reason.

Add either only after checking what it does to the repositories that would
inherit it.

## Editing the profile

`profile/README.md` is public and un-cached — a push is live immediately. The
marketplace copy in it is mirrored from [sigrix.io/about](https://sigrix.io/about);
if the site's positioning changes, change it here too.
SIGRIX_EOF_1
echo "    README.md"

cat > "SECURITY.md" <<'SIGRIX_EOF_2'
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
SIGRIX_EOF_2
echo "    SECURITY.md"

cat > "CONTRIBUTING.md" <<'SIGRIX_EOF_3'
# Contributing to Sigrix

The Sigrix platform is closed-source, so this page is about how people outside
the team can contribute — which is mostly *not* by opening pull requests.

## Found a bug, or want a feature?

Use the [Sigrix hub](https://sigrix.io/hub), not GitHub issues. Reports filed
there reach the people who can act on them, they are tied to your account so we
can reproduce the problem, and you get a reply in the same thread.

- [Report a bug or give feedback](https://sigrix.io/hub/request)
- [See what we are working on](https://sigrix.io/hub/roadmap)
- [Product updates](https://sigrix.io/hub/updates)

## Found a security vulnerability?

**Do not open an issue.** Follow the [security policy](SECURITY.md) — report it
privately through GitHub's advisory form or to support@sigrix.io.

## Want to publish on the marketplace?

Creators keep credit and a reduced commission, and every listing is tested
before it goes live.

- [Publish a listing](https://sigrix.io/publish)
- [How selling works](https://sigrix.io/sell)
- [Apply as a founding seller](https://sigrix.io/founding-sellers)

## Pull requests

Public repositories under this organisation each carry their own contribution
notes in their README — check there first. Where a repository invites patches,
the usual rules apply: open an issue describing the problem before writing code,
keep the change focused, and make sure the existing checks pass.

For the marketplace platform itself, we do not accept external pull requests.

## Contact

Anything that does not fit the above: <support@sigrix.io>.
SIGRIX_EOF_3
echo "    CONTRIBUTING.md"

cat > "CODE_OF_CONDUCT.md" <<'SIGRIX_EOF_4'
# Contributor Covenant Code of Conduct

## Our Pledge

We as members, contributors, and leaders pledge to make participation in our
community a harassment-free experience for everyone, regardless of age, body
size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status,
nationality, personal appearance, race, caste, color, religion, or sexual
identity and orientation.

We pledge to act and interact in ways that contribute to an open, welcoming,
diverse, inclusive, and healthy community.

## Our Standards

Examples of behavior that contributes to a positive environment for our
community include:

* Demonstrating empathy and kindness toward other people
* Being respectful of differing opinions, viewpoints, and experiences
* Giving and gracefully accepting constructive feedback
* Accepting responsibility and apologizing to those affected by our mistakes,
  and learning from the experience
* Focusing on what is best not just for us as individuals, but for the overall
  community

Examples of unacceptable behavior include:

* The use of sexualized language or imagery, and sexual attention or advances of
  any kind
* Trolling, insulting or derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or email address,
  without their explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

## Enforcement Responsibilities

Community leaders are responsible for clarifying and enforcing our standards of
acceptable behavior and will take appropriate and fair corrective action in
response to any behavior that they deem inappropriate, threatening, offensive,
or harmful.

Community leaders have the right and responsibility to remove, edit, or reject
comments, commits, code, wiki edits, issues, and other contributions that are
not aligned to this Code of Conduct, and will communicate reasons for moderation
decisions when appropriate.

## Scope

This Code of Conduct applies within all community spaces, and also applies when
an individual is officially representing the community in public spaces.
Examples of representing our community include using an official email address,
posting via an official social media account, or acting as an appointed
representative at an online or offline event.

## Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported to the community leaders responsible for enforcement at
**support@sigrix.io**. All complaints will be reviewed and investigated promptly
and fairly.

All community leaders are obligated to respect the privacy and security of the
reporter of any incident.

## Enforcement Guidelines

Community leaders will follow these Community Impact Guidelines in determining
the consequences for any action they deem in violation of this Code of Conduct:

### 1. Correction

**Community Impact**: Use of inappropriate language or other behavior deemed
unprofessional or unwelcome in the community.

**Consequence**: A private, written warning from community leaders, providing
clarity around the nature of the violation and an explanation of why the
behavior was inappropriate. A public apology may be requested.

### 2. Warning

**Community Impact**: A violation through a single incident or series of
actions.

**Consequence**: A warning with consequences for continued behavior. No
interaction with the people involved, including unsolicited interaction with
those enforcing the Code of Conduct, for a specified period of time. This
includes avoiding interactions in community spaces as well as external channels
like social media. Violating these terms may lead to a temporary or permanent
ban.

### 3. Temporary Ban

**Community Impact**: A serious violation of community standards, including
sustained inappropriate behavior.

**Consequence**: A temporary ban from any sort of interaction or public
communication with the community for a specified period of time. No public or
private interaction with the people involved, including unsolicited interaction
with those enforcing the Code of Conduct, is allowed during this period.
Violating these terms may lead to a permanent ban.

### 4. Permanent Ban

**Community Impact**: Demonstrating a pattern of violation of community
standards, including sustained inappropriate behavior, harassment of an
individual, or aggression toward or disparagement of classes of individuals.

**Consequence**: A permanent ban from any sort of public interaction within the
community.

## Attribution

This Code of Conduct is adapted from the [Contributor Covenant][homepage],
version 2.1, available at
[https://www.contributor-covenant.org/version/2/1/code_of_conduct.html][v2.1].

Community Impact Guidelines were inspired by
[Mozilla's code of conduct enforcement ladder][Mozilla CoC].

For answers to common questions about this code of conduct, see the FAQ at
[https://www.contributor-covenant.org/faq][FAQ]. Translations are available at
[https://www.contributor-covenant.org/translations][translations].

[homepage]: https://www.contributor-covenant.org
[v2.1]: https://www.contributor-covenant.org/version/2/1/code_of_conduct.html
[Mozilla CoC]: https://github.com/mozilla/diversity
[FAQ]: https://www.contributor-covenant.org/faq
[translations]: https://www.contributor-covenant.org/translations
SIGRIX_EOF_4
echo "    CODE_OF_CONDUCT.md"


# --- commit and push -------------------------------------------------------
echo
git add -A

if git diff --cached --quiet; then
  echo "==> No changes — the files already match what is committed. Nothing to do."
  exit 0
fi

echo "==> Staged changes:"
git diff --cached --name-status | sed 's/^/    /'
echo

git commit -q -m "Add organisation profile and shared community health files

Publishes the sigrix-io profile README, plus an org-wide security policy,
code of conduct and contributing guide.

Deliberately ships no issue or pull request templates: GitHub inherits those
into every organisation repository that has none of its own, which would have
changed issue and PR creation in the platform repo."

BRANCH="$(git symbolic-ref --short HEAD)"
echo "==> Pushing to origin/$BRANCH"
git push -u origin "$BRANCH"

echo
echo "==> Done. Open https://github.com/sigrix-io — the profile should be live."
echo "    Next: enable private vulnerability reporting at"
echo "    https://github.com/sigrix-io/.github/settings  (Security section)"
