[![Packagist][packagist-shield]][packagist-url]
[![License][license-shield]][license-url]
[![Stargazers][stars-shield]][stars-url]
[![Donate][donate-shield]][donate-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://firefly-iii.org/">
    <img src="https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/logo-small.png" alt="Firefly III" width="120" height="178">
  </a>
</p>
  <h1 align="center">Firefly III</h1>

  <p align="center">
    A free and open source personal finance manager
    <br />
    <a href="https://docs.firefly-iii.org/"><strong>Explore the documentation</strong></a>
    <br />
    <br />
    <a href="https://demo.firefly-iii.org/">View the demo</a>
    ·
    <a href="https://github.com/firefly-iii/firefly-iii/issues">Report a bug</a>
    ·
    <a href="https://github.com/firefly-iii/firefly-iii/issues">Request a feature</a>
    ·
    <a href="https://github.com/firefly-iii/firefly-iii/discussions">Ask questions</a>
  </p>

---

<p>
<img align="left" src=".github/assets/img/europe.png" alt="Flag of Europe" height="50"> Billionaires and fascists are breaking democracies and international alliances. Their profits are costing us our safety. (Digital) sovereignty is more important than ever. <strong>Firefly III</strong> is free open source software and originates from, and lives in the European Union (🇳🇱).
</p>

---

<!-- MarkdownTOC autolink="true" -->

- [About Firefly III](#about-firefly-iii)
  - [Purpose](#purpose)
- [Features](#features)
- [Who's it for?](#whos-it-for)
- [The Firefly III eco-system](#the-firefly-iii-eco-system)
- [Getting Started](#getting-started)
- [Running on macOS (Local Docker)](#running-on-macos-local-docker)
  - [Prerequisites](#prerequisites)
  - [One-click launcher app](#one-click-launcher-app)
  - [Start and stop scripts](#start-and-stop-scripts)
  - [Data storage](#data-storage)
- [Importing Statements](#importing-statements)
- [Contributing](#contributing)
- [Support the development of Firefly III](#support-the-development-of-firefly-iii)
- [License](#license)
- [Do you need help, or do you want to get in touch?](#do-you-need-help-or-do-you-want-to-get-in-touch)
- [Acknowledgements](#acknowledgements)

<!-- /MarkdownTOC -->

## About Firefly III

<p align="center">
	<img src="https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/imac-complete.png" alt="Firefly III on iMac" />
</p>

"Firefly III" is a (self-hosted) manager for your personal finances. It can help you keep track of your expenses and income, so you can spend less and save more. Firefly III supports the use of budgets, categories and tags. Using a bunch of external tools, you can import data. It also has many neat financial reports available.

Firefly III should give you **insight** into and **control** over your finances. Money should be useful, not scary. You should be able to *see* where it is going, to *feel* your expenses and to... wow, I'm going overboard with this aren't I?

But you get the idea: this is your money. These are your expenses. Stop them from controlling you. I built this tool because I started to dislike money. Having money, not having money, paying bills with money, you get the idea. But no more. I want to feel "safe", whatever my balance is. And I hope this tool can help you. I know it helps me.

### Purpose

<p align="center">
  <img src="https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/ipad-complete.png" alt="Firefly III on iPad" width="600">
</p>

Personal financial management is pretty difficult, and everybody has their own approach to it. Some people make budgets, other people limit their cashflow by throwing away their credit cards, others try to increase their current cashflow. There are tons of ways to save and earn money. Firefly III works on the principle that if you know where your money is going, you can stop it from going there.

By keeping track of your expenses and your income you can budget accordingly and save money. Stop living from paycheck to paycheck but give yourself the financial wiggle room you need.

You can read more about the purpose of Firefly III in the [documentation](https://docs.firefly-iii.org/).

## Features

Firefly III is pretty feature packed. Some important stuff first:

* It is completely self-hosted and isolated, and will never contact external servers until you explicitly tell it to.
* It features a REST JSON API that covers almost every part of Firefly III.

The most exciting features are:

* Create [recurring transactions to manage your money](https://docs.firefly-iii.org/explanation/financial-concepts/recurring/).
* [Rule based transaction handling](https://docs.firefly-iii.org/how-to/firefly-iii/features/rules/) with the ability to create your own rules.

Then the things that make you go "yeah OK, makes sense".

* A [double-entry](https://en.wikipedia.org/wiki/Double-entry_bookkeeping_system) bookkeeping system.
* Save towards a goal using [piggy banks](https://docs.firefly-iii.org/explanation/financial-concepts/piggy-banks/).
* View [income and expense reports](https://docs.firefly-iii.org/how-to/firefly-iii/finances/reports/).

And the things you would hope for but not expect:

* 2 factor authentication for extra security 🔒.
* Supports [any currency you want](https://docs.firefly-iii.org/how-to/firefly-iii/features/currencies/).
* There is a [Docker image](https://docs.firefly-iii.org/how-to/firefly-iii/installation/docker/).

And to organise everything:

* Clear views that should show you how you're doing.
* Easy navigation through your records.
* Lots of charts because we all love them.

Many more features are listed in the [documentation](https://docs.firefly-iii.org/explanation/firefly-iii/about/introduction/).

## Who's it for?
<img src="https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/iphone-complete.png" alt="Firefly III on iPhone" align="left" width="250">

 This application is for people who want to track their finances, keep an eye on their money **without having to upload their financial records to the cloud**. You're a bit tech-savvy, you like open source software and you don't mind tinkering with (self-hosted) servers.
 
 <br clear="left"/>

## The Firefly III eco-system

Several users have built pretty awesome stuff around the Firefly III API. [Check out these tools in the documentation](https://docs.firefly-iii.org/references/firefly-iii/third-parties/apps/).

## Getting Started

There are many ways to run Firefly III
1. There is a [demo site](https://demo.firefly-iii.org) with an example financial administration already present.
2. You can [install it on your server](https://docs.firefly-iii.org/how-to/firefly-iii/installation/self-managed/).
3. You can [run it using Docker](https://docs.firefly-iii.org/how-to/firefly-iii/installation/docker/).
4. You can [deploy via Kubernetes](https://firefly-iii.github.io/kubernetes/).
5. You can [install it using Softaculous](https://www.softaculous.com/softaculous/apps/others/Firefly_III).
6. You can [install it using AMPPS](https://www.ampps.com/).
7. You can [install it on Cloudron](https://cloudron.io/store/org.fireflyiii.cloudronapp.html).
8. You can [install it on Lando](https://gist.github.com/ArtisKrumins/ccb24f31d6d4872b57e7c9343a9d1bf0).
9. You can [install it on Yunohost](https://github.com/YunoHost-Apps/firefly-iii).

## Running on macOS (Local Docker)

This repository includes a self-contained macOS launcher that runs Firefly III entirely on your Mac using Docker. No cloud account or server is required. All data stays local.

### Prerequisites

- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop/) installed (does **not** need to be manually started — the launcher handles that)
- macOS 12 Monterey or later
- Python 3 (ships with macOS, used for secure key generation on first run)

### One-click launcher app

**`Firefly III.app`** is a native macOS application bundle in the root of this repository. Double-click it from Finder to get a menu with three options:

| Option | What it does |
|---|---|
| **Open Firefly III** | Starts Docker Desktop if not running, spins up all containers, opens `http://localhost` in your browser |
| **Import Statements** | Opens a Terminal session to parse bank/credit card statements and produce import-ready CSV files |
| **Stop Firefly III and Close** | Shuts down all Firefly containers cleanly |

You can also drag `Firefly III.app` into your `/Applications` folder or pin it to the Dock.

### Start and stop scripts

Two plain shell scripts are available if you prefer the terminal, or if you want to automate things:

| Script | Purpose |
|---|---|
| [`start-firefly.command`](start-firefly.command) | Bootstraps config files on first run, starts Docker Desktop if needed, starts containers, opens browser |
| [`stop-firefly.command`](stop-firefly.command) | Stops and removes all running Firefly containers |

Both scripts are double-clickable from Finder as well (`*.command` files open in Terminal on macOS).

**First run behaviour:** on the first launch, `start-firefly.command` automatically downloads the official Docker Compose file and configuration templates into `.firefly-docker/`, generates a secure random `APP_KEY` (32 chars) and a random database password, and writes them into `.firefly-docker/.env` and `.firefly-docker/.db.env`. You do not need to edit any files manually.

**Subsequent runs:** configuration files are reused as-is. Containers are re-pulled from Docker Hub to pick up upstream updates.

### Data storage

All data is stored **locally on your Mac** inside Docker-managed volumes. Nothing is sent to the cloud.

| Volume | Contents | Docker volume name |
|---|---|---|
| Database | All transactions, accounts, budgets, rules, settings | `firefly-docker_firefly_iii_db` |
| Uploads | Attached receipts and imported files | `firefly-docker_firefly_iii_upload` |

The underlying database engine is **MariaDB** (MySQL-compatible), running inside its own container. Connection credentials are stored in `.firefly-docker/.db.env` and `.firefly-docker/.env`.

To back up your data, export a dump from the running database container (the password is stored in `.firefly-docker/.db.env` under `MYSQL_PASSWORD`):

```bash
docker exec firefly_iii_db mysqldump -u firefly --password="YOUR_MYSQL_PASSWORD" firefly > firefly-backup-$(date +%Y%m%d).sql
```

## Importing Statements

A local statement parser is included to convert bank and credit card exports into Firefly III Data Importer-compatible CSV files. **All processing happens locally — no data is sent anywhere.**

### Supported formats

| Source | File type | Example filename |
|---|---|---|
| Bank of America Checking (Debit) | CSV | `stmt.csv` |
| Chase Freedom Unlimited (Credit) | CSV | `Chase****_Activity*.csv` |
| Bank of America Cash Rewards (Credit) | CSV | `MonthYear_****.csv` |
| Apple Card (Credit) | PDF | `Apple Card Statement - February 2026.pdf` |

### How to use

1. **Drop files** into `statements/inbox/`
2. **Run the parser** — either:
   - Select **Import Statements** from `Firefly III.app`, or
   - Run from terminal: `python3 scripts/parse-statements.py`
3. **Review the preview** — the parser shows every transaction and asks you to confirm before writing
4. **Import into Firefly III** — upload the generated CSV + JSON config from `statements/output/` into the [Firefly III Data Importer](https://docs.firefly-iii.org/how-to/data-importer/)

### What the parser does

- Detects credit card payments and inter-account transfers automatically and **excludes them** to avoid duplicate transactions (e.g. paying off a Chase card from your BofA checking)
- Generates a stable `external-id` per transaction so the Data Importer can deduplicate if you re-import
- Tracks processed files (by content hash + modification date) to warn you about re-uploads
- Preserves categories from sources that provide them (e.g. Chase "Food & Drink")

### First-time setup

```bash
pip3 install -r scripts/requirements.txt
```

This installs `pdfplumber` for PDF statement parsing. The macOS app handles this automatically.

## Contributing

You can contact me at [james@firefly-iii.org](mailto:james@firefly-iii.org), you may open an issue in the [main repository](https://github.com/firefly-iii/firefly-iii) or contact me through [gitter](https://gitter.im/firefly-iii/firefly-iii) and [Mastodon](https://fosstodon.org/@ff3).

Of course, there are some [contributing guidelines](https://docs.firefly-iii.org/explanation/support/#contributing-code) and a [code of conduct](https://github.com/firefly-iii/firefly-iii/blob/main/.github/code_of_conduct.md), which I invite you to check out.

I can always use your help [squashing bugs](https://docs.firefly-iii.org/explanation/support/), thinking about [new features](https://docs.firefly-iii.org/explanation/support/) or [translating Firefly III](https://docs.firefly-iii.org/how-to/firefly-iii/development/translations/) into other languages.

[Sonarcloud][sc-project-url] scans the code of Firefly III. If you want to help improve Firefly III, check out the latest reports and take your pick!

[![Quality Gate Status][sc-gate-shield]][sc-project-url] [![Bugs][sc-bugs-shield]][sc-project-url] [![Code Smells][sc-smells-shield]][sc-project-url] [![Vulnerabilities][sc-vuln-shield]][sc-project-url]

There is also a [security policy](https://github.com/firefly-iii/firefly-iii/security/policy).

[![CII Best Practices][bp-badge]][bp-url]

<!-- SPONSOR TEXT -->

## Support the development of Firefly III

Firefly III is a side gig. With your sponsorship or support, I can spend more time on Firefly III. So, if you like Firefly III, and if it helps you save lots of money, why not send me a dime for every dollar saved! 🥳

OK, that was a joke. But for real, when you feel Firefly III made your life better, please consider contributing as a sponsor. Please check out my [Patreon](https://www.patreon.com/jc5) and [GitHub Sponsors](https://github.com/sponsors/JC5) page for more information. You can also [buy me a ☕️ coffee at ko-fi.com](https://ko-fi.com/Q5Q5R4SH1) or send something my way using [Liberapay](https://liberapay.com/JC5). Thank you for your consideration.

### Sponsorships

Firefly III is sponsored by TestMu AI. Their support allows me to test Firefly III more easily and introduce even fewer bugs with every release.

Browser testing via:

<a href="https://www.testmuai.com/?utm_source=fireflyiii&utm_medium=sponsor" target="_blank">
<img src=".github/assets/img/testmu.png" alt="Testmu" style="vertical-align: middle;" width="250" />
</a>

<!-- END OF SPONSOR TEXT -->

## License

This work [is licensed](https://github.com/firefly-iii/firefly-iii/blob/main/LICENSE) under the [GNU Affero General Public License v3](https://www.gnu.org/licenses/agpl-3.0.html).

<!-- HELP TEXT -->

## Do you need help, or do you want to get in touch?

Do you want to contact me? You can email me at [james@firefly-iii.org](mailto:james@firefly-iii.org) or get in touch through one of the following support channels:

- [GitHub Discussions](https://github.com/firefly-iii/firefly-iii/discussions/) for questions and support
- [Gitter.im](https://gitter.im/firefly-iii/firefly-iii) for a good chat and a quick answer
- [GitHub Issues](https://github.com/firefly-iii/firefly-iii/issues) for bugs and issues
- <a rel="me" href="https://fosstodon.org/@ff3">Mastodon</a> for news and updates

<!-- END OF HELP TEXT -->


## Acknowledgements

Over time, [many people have contributed to Firefly III](https://github.com/firefly-iii/firefly-iii/graphs/contributors). I'm grateful for their support and code contributions.

The Firefly III logo is made by the excellent Cherie Woo.

[packagist-shield]: https://img.shields.io/packagist/v/grumpydictator/firefly-iii.svg?style=flat-square
[packagist-url]: https://packagist.org/packages/grumpydictator/firefly-iii
[license-shield]: https://img.shields.io/github/license/firefly-iii/firefly-iii.svg?style=flat-square
[license-url]: https://www.gnu.org/licenses/agpl-3.0.html
[stars-shield]: https://img.shields.io/github/stars/firefly-iii/firefly-iii.svg?style=flat-square
[stars-url]: https://github.com/firefly-iii/firefly-iii/stargazers
[donate-shield]: https://img.shields.io/badge/donate-%24%20%E2%82%AC-brightgreen?style=flat-square
[donate-url]: #support-the-development-of-firefly-iii
[build-shield]: https://api.travis-ci.com/firefly-iii/firefly-iii.svg?branch=master
[build-url]: https://travis-ci.com/github/firefly-iii/firefly-iii
[sc-gate-shield]: https://sonarcloud.io/api/project_badges/measure?project=firefly-iii_firefly-iii&metric=alert_status
[sc-bugs-shield]: https://sonarcloud.io/api/project_badges/measure?project=firefly-iii_firefly-iii&metric=bugs
[sc-smells-shield]: https://sonarcloud.io/api/project_badges/measure?project=firefly-iii_firefly-iii&metric=code_smells
[sc-vuln-shield]: https://sonarcloud.io/api/project_badges/measure?project=firefly-iii_firefly-iii&metric=vulnerabilities
[sc-project-url]: https://sonarcloud.io/dashboard?id=firefly-iii_firefly-iii
[bp-badge]: https://bestpractices.coreinfrastructure.org/projects/6335/badge
[bp-url]: https://bestpractices.coreinfrastructure.org/projects/6335 
