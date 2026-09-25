# Day 09 – Linux User and Group Management

## Overview

Today I practised Linux user and group management by creating multiple users, assigning them to different groups, configuring shared directories, and testing permissions between users.

This helped me understand how Linux controls access using users, groups, ownership, and file permissions.

---

## Tasks Completed

### 1. Created Users

Created three Linux users:

```bash
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
```

Set passwords:

```bash
sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
```

Verified the users:

```bash
grep -E 'tokyo|berlin|professor' /etc/passwd
```

Checked their home directories:

```bash
ls -l /home/
```

---

## 2. Created Groups

Created two groups:

```bash
sudo groupadd heist
sudo groupadd police
```

Verified them:

```bash
grep -E 'heist|police' /etc/group
```

---

## 3. Assigned Users to Groups

Added Tokyo and Berlin to the `heist` group:

```bash
sudo usermod -aG heist tokyo
sudo usermod -aG heist berlin
```

Added Professor to the `police` group:

```bash
sudo usermod -aG police professor
```

Verified memberships:

```bash
groups tokyo
groups berlin
groups professor
```

---

## 4. Created Shared Directories

Created shared directories for both groups:

```bash
sudo mkdir -p /shared/heist
sudo mkdir -p /shared/police
```

Assigned group ownership:

```bash
sudo chown :heist /shared/heist
sudo chown :police /shared/police
```

Applied permissions:

```bash
sudo chmod 2770 /shared/heist
sudo chmod 2770 /shared/police
```

Verified:

```bash
ls -ld /shared/heist /shared/police
```

The `2` in `2770` enables the **setgid bit**, meaning files created inside the directory inherit the directory's group.

---

## 5. Tested Tokyo Access

Switched to Tokyo:

```bash
su - tokyo
```

Created a file inside the Heist directory:

```bash
echo "Tokyo was here" > /shared/heist/tokyo.txt
```

Verified:

```bash
ls -l /shared/heist
cat /shared/heist/tokyo.txt
```

Tested access to the Police directory:

```bash
touch /shared/police/test.txt
```

Result:

```text
Permission denied
```

This confirmed that Tokyo could access the `heist` directory but not the `police` directory.

---

## 6. Tested Berlin Access

Switched to Berlin:

```bash
su - berlin
```

Created a file:

```bash
echo "Berlin was here" > /shared/heist/berlin.txt
```

Verified:

```bash
ls -l /shared/heist
```

Tested Police directory access:

```bash
touch /shared/police/berlin-test.txt
```

Result:

```text
Permission denied
```

Berlin could access the `heist` directory but was blocked from the `police` directory.

---

## 7. Tested Professor Access

Switched to Professor:

```bash
su - professor
```

Created a file:

```bash
echo "Professor was here" > /shared/police/professor.txt
```

Verified:

```bash
ls -l /shared/police
cat /shared/police/professor.txt
```

Tested Heist directory access:

```bash
touch /shared/heist/professor-test.txt
```

Result:

```text
Permission denied
```

Professor could access the `police` directory but not the `heist` directory.

---

## Final Verification

```bash
id tokyo
id berlin
id professor

ls -ld /shared/heist /shared/police
ls -l /shared/heist
ls -l /shared/police
```

---

## Key Commands Learned

```bash
useradd
passwd
groupadd
usermod
groups
id
chown
chmod
mkdir
su
```

---

## Key Concepts Learned

- Linux user management
- Linux group management
- Primary and supplementary groups
- File and directory ownership
- Group-based access control
- Linux permission bits
- `chmod`
- `chown`
- `setgid`
- Shared directories
- Access permission testing

---

## What I Learned

The biggest takeaway from Day 09 was understanding that Linux permissions are not just about `read`, `write`, and `execute`.

By combining users, groups, ownership, permissions, and `setgid`, I can create controlled shared environments where users can collaborate while preventing unauthorised access to other directories.

This is particularly important in Linux administration, cloud environments, DevOps systems, and production servers.

## Day 09 Complete ✅

Successfully completed Linux User & Group Management as part of my **90 Days of DevOps** journey.
