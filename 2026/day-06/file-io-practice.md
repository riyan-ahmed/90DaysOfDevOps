# Day 06 - Linux Fundamentals: Read and Write Text Files

## Commands Used

touch notes.txt
- Created an empty file.
  <img width="391" height="25" alt="creating notes" src="https://github.com/user-attachments/assets/12ac1525-b6be-4698-9a27-e02f3a2a6394" />


echo "text" > notes.txt
- Wrote text to the file.
<img width="551" height="36" alt="png" src="https://github.com/user-attachments/assets/9ea8bf36-5f4b-4316-a06d-02cb3db1da26" />

echo "text" >> notes.txt
- Appended text to the file.
<img width="646" height="29" alt="png" src="https://github.com/user-attachments/assets/be22519c-529c-4bb7-bc08-2fe69664b946" />


echo "text" | tee -a notes.txt
- Displayed output and appended it to the file.
  <img width="737" height="31" alt="tee" src="https://github.com/user-attachments/assets/549b3edb-d40a-4d5f-ab25-0968e38e97f5" />


cat notes.txt
- Displayed the full file.
<img width="408" height="192" alt="cat notes" src="https://github.com/user-attachments/assets/c40604ec-5d9b-4f4c-844d-43a38ea140d2" />


head -n 3 notes.txt
- Displayed the first 3 lines.
<img width="390" height="91" alt="head" src="https://github.com/user-attachments/assets/5c4d6649-c457-4d4d-b5ea-632b1aa1b957" />


tail -n 3 notes.txt
- Displayed the last 3 lines.
<img width="381" height="80" alt="tail" src="https://github.com/user-attachments/assets/8f9ff3c4-6d13-46e8-903b-3a3f3744aa78" />


## Outcome

Successfully created, modified, and read a text file using basic Linux commands.
