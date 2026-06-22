# Real time output of commands I practiced

## Process commands
* `ps -aux | head -n 10` - List running processes(top 10 lines).
* `pgrep -x sshd` - Get the process id by process name.
<img width="722" height="200" alt="ps aux" src="https://github.com/user-attachments/assets/a20f56d5-0ad9-4c34-9d0d-fcef5a7a14f7" />

## Service commands
* `systemctl status | head -n 20` - Prints first 20 lines of system service status summary.
<img width="607" height="318" alt="sys stat head" src="https://github.com/user-attachments/assets/4fcfbe65-c10a-4f97-9b1b-8bd38722bf15" />

* `systemctl list-units --type=service --state=running | head` - Prints first 10 lines of running services status.
<img width="820" height="172" alt="sys status running list" src="https://github.com/user-attachments/assets/fbce6185-fde5-474c-84ac-3b3f2cfdc940" />


## Log commands
* `journalctl -u ssh` - Displays logs for the SSH service.
<img width="853" height="456" alt="journal -ussh" src="https://github.com/user-attachments/assets/93011eba-10a6-4cd7-8fbe-8bda3a1d6aa5" />

* `tail -n 40 /var/log/auth.log` - Last 40 lines of the authentication log(ssh, sudo).
<img width="853" height="408" alt="tail auth" src="https://github.com/user-attachments/assets/a475b9be-f2a0-4dfa-a85e-1fe2d509a2ea" />

## Service for inspection (SSH)
`systemctl status ssh`
<img width="857" height="407" alt="ssh active" src="https://github.com/user-attachments/assets/ff9f90ee-d4ce-421a-a9cb-ca612c6dd8d0" />


It is running now lets stop it. And try to connect to localhost.
<img width="517" height="62" alt="stop ssh" src="https://github.com/user-attachments/assets/b102275e-a2fe-42b0-a75b-da44f5c7253a" />

Giving error 

<img width="441" height="32" alt="connection refused" src="https://github.com/user-attachments/assets/71965940-bfd3-48f6-aa50-12d1224c6808" />


Let's view logs and check
<img width="858" height="260" alt="Screenshot 2026-06-22 at 10 29 26" src="https://github.com/user-attachments/assets/09d82160-82d8-4a2a-ac11-cf0885042edc" />


Log shows the service is stopped let's start the ssh service and check again
<img width="858" height="260" alt="Screenshot 2026-06-22 at 10 29 26" src="https://github.com/user-attachments/assets/69516944-d82f-47ce-8422-45bb87c8a1e9" />


Service started and localhost connection made

<img width="546" height="438" alt="connect to localhost" src="https://github.com/user-attachments/assets/43bf6027-b1c3-4911-b1f9-654a9f9779f8" />

