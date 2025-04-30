# toolz - Bash Multi-Tool Utility

A modular and interactive Bash script that brings together several essential system tools into one unified command-line utility.

## Overview

**toolz** is a multifunctional utility designed to simplify everyday system administration tasks. From finding files and monitoring system stats to managing processes and users, this script makes it easier to interact with Linux system tools via an intuitive and well-documented interface.

## Features

### Find Helper (`-f`)
Interactive assistant for the `find` command with step-by-step prompts to customize search location, pattern, and parameters.

### System Information (`-s`)
Displays essential system metrics like memory usage, running processes, and disk usage in a clean format.

### Process Management (`-p`)
Shows top resource-consuming processes with options to sort by CPU, memory, or runtime. Includes an interactive mode to kill processes.

### User Management (`-u`)
Displays currently logged-in users, user account information, and user resource usage with appropriate permission checks.

### Help System (`-h`)
Comprehensive usage guide with examples and detailed explanations for all options and features.

## Code Structure

- Modular Design: Each feature is implemented as a separate function.
- Input Validation: Ensures robust handling of user inputs and system commands.
- Error Handling: Friendly error messages and graceful exits.
- Documentation: Each function includes comments and descriptions for readability and maintainability.
- Interactive Prompts: Used where appropriate for user engagement and safety (e.g., killing processes).

## Example Usage

```bash
./toolz -f
# Launch the interactive find helper

./toolz -s
# View system statistics

./toolz -p
# List processes and choose sorting options or kill them

./toolz -u
# See user session data and account information

./toolz -h
# Display help with examples
