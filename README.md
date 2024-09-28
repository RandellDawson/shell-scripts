# Bash Scripts Repository

## Overview

This repository contains a collection of Bash scripts I use for running various local tasks. 

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Scripts](#scripts)
  - [Activate Current Virtual Environment Script: `activate-venv.sh`](#activate-current-virtual-environment-script-activate-venvsh)
  - [Stock Alerts App Runner: `run-stock-alerts-app.sh`](#stock-alerts-app-runner-run-stock-alerts-appsh)
- [License](#license)

## Prerequisites

Ensure you have the following installed on your system:

- Bash version 4.0 or higher
- Any dependencies specific to the scripts (if applicable)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/bash-scripts.git
   cd bash-scripts
   ```

2. Make all scripts executable:
   ```bash
   chmod +x *.sh
   ```

## Scripts

### Activate Current Virtual Environment Script: `activate-venv.sh`

**Description**: This script returns the full path to any virtual environment in current folder (normally some Python project I am building), so you can create an alias in `~/.bash_aliases` like below to activate it.  Using this alias makes it so you do not have to type `source name-of-virtual-environment/bin/activate`.

#### Example ~./bash_aliases entry:
```bash
alias activate_venv='venv_path=$(bash /path/to/bash-scripts/activate-venv.sh) && [[ -f "$venv_path" ]] && source "$venv_path"'
```

&nbsp;

### Stock Alerts App Runner: `run-stock-alerts-app.sh`

**Description**: This script runs the Stock Alerts app, which monitors stock data and sends alerts based on predefined criteria. It ensures that the app is running in the appropriate environment and handles any necessary startup configurations.

## License
Copyright © 2024, Randell Dawson

The content of this repository is bound by the [MIT](LICENSE.md) license.