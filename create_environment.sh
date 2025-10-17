#!/bin/bash

# Prompting the user and creating the parent directory
echo "Enter your name down below "
read name
mkdir "submission_reminder_$name"

# Creating child directories
mkdir submission_reminder_$name/app
mkdir submission_reminder_$name/modules
mkdir submission_reminder_$name/assets
mkdir submission_reminder_$name/config

# Creating reminder.sh
cat > submission_reminder_$name/app/reminder.sh << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Creating functions.sh
cat > submission_reminder_$name/modules/functions.sh << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Creating submissions.txt with additional 5 students
cat > submission_reminder_$name/assets/submissions.txt << 'EOF'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Luffy, Python scripting, not submitted
Obito, MySQL basics, submitted
Killua, Django framework, submitted
Gon, Shell permissions, not submitted
Gojo, Git, submitted
Naruto, Shell Navigation, not submitted
Sasuke, Docker basics, submitted
Sakura, Git, not submitted
Kakashi, Shell Navigation, submitted
Itachi, Web Development, not submitted
EOF

# Creating config.env
cat > submission_reminder_$name/config/config.env << 'EOF'
#!/bin/bash

# This is the config file
ASSIGNMENT="Git"
DAYS_REMAINING=2
EOF

# Creating startup.sh
cat > submission_reminder_$name/startup.sh << 'EOF'
#!/bin/bash

# Check if config.env exists in the config directory
if [ ! -f "./config/config.env" ]; then
    echo "Error: config.env file not found in config directory!"
    exit 1
fi

# Run the reminder app
./app/reminder.sh
EOF

# Creating copilot_shell_script.sh (Task 2)
cat > submission_reminder_$name/copilot_shell_script.sh << 'EOF'
#!/bin/bash

# Copilot Shell Script - Update assignment and check submissions

echo "============================================"
echo "   Assignment Reminder Copilot Script"
echo "============================================"
echo ""

# Prompt user for the assignment name
echo "Enter the new assignment name:"
read assignment_name

# Check if the user entered something
if [ -z "$assignment_name" ]; then
    echo "Error: Assignment name cannot be empty!"
    exit 1
fi

# Path to the config file
config_file="./config/config.env"

# Check if config.env exists
if [ ! -f "$config_file" ]; then
    echo "Error: config.env file not found at $config_file"
    exit 1
fi

# Use sed to replace the ASSIGNMENT value in config.env
# This finds the line starting with ASSIGNMENT= and replaces the entire line
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$config_file"

# Check if sed was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Assignment updated successfully to: $assignment_name"
    echo "✓ Updated in: $config_file"
    echo ""
    echo "============================================"
    echo "   Running Startup Script..."
    echo "============================================"
    echo ""
    
    # Run the startup.sh script to check submissions for the new assignment
    ./startup.sh
else
    echo "Error: Failed to update the assignment in config.env"
    exit 1
fi
EOF

# Making all .sh files executable
chmod +x submission_reminder_$name/app/reminder.sh
chmod +x submission_reminder_$name/modules/functions.sh
chmod +x submission_reminder_$name/config/config.env
chmod +x submission_reminder_$name/startup.sh
chmod +x submission_reminder_$name/copilot_shell_script.sh

echo "Environment created successfully!"
echo ""
echo "To run the application:"
echo "  cd submission_reminder_$name"
echo "  ./startup.sh"
echo ""
echo "To change the assignment and rerun:"
echo "  ./copilot_shell_script.sh"