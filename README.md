# Submission Reminder Application

This repository contains the setup and management scripts for a basic Linux-based application designed to alert students about upcoming assignment deadlines.

## Repository Contents

* **`create_environment.sh`**: A shell script to set up the necessary directory structure and files for the application.
* **`copilot_shell_script.sh`**: A utility script to update the assignment name in the application's configuration and rerun the reminder check.
* **`README.md`**: This instruction guide.

## How to Run the Application

### Step 1: Create the Application Environment

Execute the setup script. It will prompt you for your name and create the main application directory, `submission_reminder_{yourName}`, containing the scripts, configuration, and data files.

```bash
chmod +x create_environment.sh
./create_environment.sh