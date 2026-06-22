## Environment Basics

### Command 1
uname -a

Observation:
Shows kernel version, architecture, and system information.

### Command 2
cat /etc/os-release

Observation:
Confirms Ubuntu version running on the EC2 instance.

## Filesystem Sanity

### Command 3
mkdir /tmp/runbook-demo

Observation:
Temporary test directory created successfully.

### Command 4
cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo

Observation:
File copy worked correctly, so basic filesystem operations are healthy.

## Target Service Check

### Command 5
systemctl status ssh

Observation:
SSH service is active and running.

## CPU & Memory Snapshot

### Command 6
pgrep sshd

Observation:
Found the running SSH daemon process ID.

### Command 7
ps -o pid,pcpu,pmem,comm -p <PID>

Observation:
SSH is using low CPU and memory, so no process-level pressure is visible.

### Command 8
free -h

Observation:
Memory usage is normal and there is available memory.

## Disk & IO Snapshot

### Command 9
df -h

Observation:
Disk usage is within a safe range.

### Command 10
du -sh /var/log

Observation:
Log directory size is not unusually large.

## Network Snapshot

### Command 11
sudo ss -tulpn | grep ssh

Observation:
SSH is listening on port 22, so the service is available for network connections.

## Logs Reviewed

### Command 12
sudo journalctl -u ssh -n 50

Observation:
No critical SSH service errors found in the recent logs.

### Command 13
sudo tail -n 50 /var/log/auth.log

Observation:
Authentication logs show recent SSH activity. No major issue found.




## Quick Findings

- SSH service is running.
- CPU and memory usage are normal.
- Disk usage is healthy.
- SSH is listening on port 22.
- Logs do not show critical errors.

## If This Worsens

1. Restart SSH safely:
   sudo systemctl restart ssh

2. Check recent logs:
   sudo journalctl -u ssh --since "1 hour ago"

3. Collect deeper diagnostics:
   sudo strace -p <PID>
