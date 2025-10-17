# Submission Reminder App

This project is a simple shell-based application to check for pending assignment submissions and send reminders for students that are yet to submit.


## Usage of the app

A step by step guide to that tell you how to get a development env running:

1. Clone the repository and navigate into the new directory containing the provided script using:
```
git clone https://github.com/imenarh/submission_reminder_app_ibenito-cpu
cd submission_reminder_app_ibenito-cpu
```

2. Run the `create_environment.sh` script using the command below to set up the project structure and populate the necessary files.
```
./create_environment.sh
```

3. Run the reminder app `startup.sh` script. 
You should first `cd {name of the new submission_reminder_}` folder that was created.
```
./startup.sh
```
This will run the Reminder app and find students that haven't submitted their assignments from the `submission.txt` file.

4. To update the assignment being checked, you can run the `copilot_shell_script.sh` from the root of the project directory.
```
./copilot_shell_script.sh
```
This will prompt you for a new assignment name, update the configuration, and make new reminders.


## Main Scripts

-   `.create_environment.sh`: Sets up the initial project structure and files.
-   `.startup.sh`: Runs the main application logic to check for submissions.
-   `.copilot_shell_script.sh`: A helper script to easily update the assignment being checked.