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
