# Shell Automation Toolkit

A collection of **shell scripts** to automate common tasks for system maintenance, project management, backups, cleanup, and version tracking. Designed to save time, reduce errors, and streamline workflows.

## Features

### System & Project Management

- **Project Initialization** – Quickly set up new project directories with predefined templates.
- **Version Tracking** – Track changes to files and maintain a simple version history.
- **Automated Tasks** – Run repetitive tasks automatically using custom scripts.

### Backup & Cleanup

- **Backup Script** – Create backups of important directories or databases.
- **Cleanup Script** – Remove temporary files, logs, and unused artifacts to free up space.
- **Scheduled Automation** – Scripts can be scheduled via `cron` to run automatically.

### Utilities

- **Logging & Reporting** – Generate logs of automated operations for easy tracking.
- **Notification** – Optional notifications for completed tasks.

---

## Installation / Setup

1. Clone the repository:

```
git clone https://github.com/Hussein-Hassan777/shell_scripts.git
```

1. Navigate to the project folder:

```
cd shell_scripts
```

1. Give execute permissions to scripts:

```
chmod +x *.sh
```

1. (Optional) Add scripts to your PATH for global access:

```
exportPATH=$PATH:/path/to/shell_scrips
```

---

## Usage Examples

- **Run a backup**:

```
./backup.sh /path/to/source /path/to/destination
```

- **Clean temporary files**:

```
./cleanup.sh /path/to/cleanup
```

- **Initialize a new project**:

```
./init_project.sh project_name
```

- **Track versions**:

```
./version_tracker.sh file_or_directory
```

---

## Requirements

- Linux or macOS system
- Bash shell (`#!/bin/bash`)
- Standard Unix utilities: `cp`, `rm`, `tar`, `rsync`, `cron` (for scheduled tasks)

---

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a new branch (`git checkout -b feature-name`)
3. Commit your changes (`git commit -am 'Add feature'`)
4. Push to the branch (`git push origin feature-name`)
5. Open a Pull Request

---

## Author

**Hussein Hassan Hendawy** – Computer Science & AI | Benha University
