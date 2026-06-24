# Day 06 - Linux Fundamentals: Read and Write Text Files

## Commands Used

> touch notes.txt

Create a textfile with name notes.txt

>echo "Hi, I am Riyan" > notes.txt

Write to notes.txt

> echo "I am a devops enthusiast" >> notes.txt

> echo "Today is day06 of learning linux" >> notes.txt

Append to notes.txt

> cat notes.txt

> Read notes.txt

> cat notes.txt | head -n 1

Read first line of notes.txt

> cat notes.txt | tail -n 2

Read last two lines of notes.txt

> echo "Learn using tee command" | tee -a notes.txt

Write using tee command that also prints the output to terminal -a appends

## Outcome
<img width="645" height="279" alt="Screenshot 2026-06-24 at 11 08 42" src="https://github.com/user-attachments/assets/54140751-05eb-4174-a4f1-a41608773067" />

Successfully created, modified, and read a text file using basic Linux commands.
