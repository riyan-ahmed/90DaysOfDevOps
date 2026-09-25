Last login: Wed Sep 23 13:07:53 on ttys000
riyan_ahmed@Riyans-MacBook-Pro ~ % cd Downloads 
riyan_ahmed@Riyans-MacBook-Pro Downloads % chmod 400 "Linux-key.pem"
riyan_ahmed@Riyans-MacBook-Pro Downloads % ssh -i "Linux-key.pem" ubuntu@ec2-34-245-23-182.eu-west-1.compute.amazonaws.com
The authenticity of host 'ec2-34-245-23-182.eu-west-1.compute.amazonaws.com (34.245.23.182)' can't be established.
ED25519 key fingerprint is: SHA256:dRUw151mRW5cGEuqTaB+vJQDUD52X9bhwuOvkIpx7G0
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:33: ec2-52-213-100-50.eu-west-1.compute.amazonaws.com
    ~/.ssh/known_hosts:36: ec2-3-251-85-121.eu-west-1.compute.amazonaws.com
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-34-245-23-182.eu-west-1.compute.amazonaws.com' (ED25519) to the list of known hosts.
Welcome to Ubuntu 26.04 LTS (GNU/Linux 7.0.0-1006-aws x86_64)

 * Documentation:  https://docs.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri Sep 25 13:49:34 UTC 2026

  System load:  0.19              Temperature:           -273.1 C
  Usage of /:   31.1% of 6.61GB   Processes:             123
  Memory usage: 27%               Users logged in:       0
  Swap usage:   0%                IPv4 address for ens5: 172.31.32.139


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Sat Sep 19 20:24:18 2026 from 31.113.105.196
ubuntu@ip-172-31-32-139:~$ uname -a
Linux ip-172-31-32-139 7.0.0-1006-aws #6-Ubuntu SMP PREEMPT Tue May 26 12:04:34 UTC 2026 x86_64 GNU/Linux
ubuntu@ip-172-31-32-139:~$ cat /etc/os-release
PRETTY_NAME="Ubuntu 26.04 LTS"
NAME="Ubuntu"
VERSION_ID="26.04"
VERSION="26.04 LTS (Resolute Raccoon)"
VERSION_CODENAME=resolute
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=resolute
LOGO=ubuntu-logo
ubuntu@ip-172-31-32-139:~$ uptime
 13:50:21 up 1 min,  1 user,  load average: 0.08, 0.04, 0.01
ubuntu@ip-172-31-32-139:~$ systemctl --failed
  UNIT LOAD ACTIVE SUB DESCRIPTION

0 loaded units listed.
ubuntu@ip-172-31-32-139:~$ ps aux | head
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  1.6  1.6  24784 15424 ?        Ss   13:49   0:01 /sbin/init
root           2  0.0  0.0      0     0 ?        S    13:49   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    13:49   0:00 [pool_workqueue_release]
root           4  0.0  0.0      0     0 ?        I<   13:49   0:00 [kworker/R-rcu_gp]
root           5  0.0  0.0      0     0 ?        I<   13:49   0:00 [kworker/R-sync_wq]
root           6  0.0  0.0      0     0 ?        I<   13:49   0:00 [kworker/R-kvfree_rcu_reclaim]
root           7  0.0  0.0      0     0 ?        I<   13:49   0:00 [kworker/R-slub_flushwq]
root           8  0.0  0.0      0     0 ?        I<   13:49   0:00 [kworker/R-netns]
root           9  0.0  0.0      0     0 ?        I    13:49   0:00 [kworker/0:0-rcu_gp]
ubuntu@ip-172-31-32-139:~$ free -h
               total        used        free      shared  buff/cache   available
Mem:           908Mi       308Mi       429Mi       2.7Mi       279Mi       600Mi
Swap:             0B          0B          0B
ubuntu@ip-172-31-32-139:~$ df -h
Filesystem       Size  Used Avail Use% Mounted on
/dev/root        6.7G  2.1G  4.6G  32% /
tmpfs            455M     0  455M   0% /dev/shm
tmpfs            182M  888K  181M   1% /run
efivarfs         128K  3.3K  120K   3% /sys/firmware/efi/efivars
tmpfs            455M     0  455M   0% /tmp
none             1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
none             1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
/dev/nvme0n1p13  989M   96M  827M  11% /boot
/dev/nvme0n1p15  105M  6.3M   99M   7% /boot/efi
none             1.0M     0  1.0M   0% /run/credentials/systemd-networkd.service
none             1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
none             1.0M     0  1.0M   0% /run/credentials/serial-getty@ttyS0.service
tmpfs             91M  8.0K   91M   1% /run/user/1000
ubuntu@ip-172-31-32-139:~$ free -h
               total        used        free      shared  buff/cache   available
Mem:           908Mi       308Mi       429Mi       2.7Mi       279Mi       600Mi
Swap:             0B          0B          0B
ubuntu@ip-172-31-32-139:~$ df -i
Filesystem       Inodes IUsed   IFree IUse% Mounted on
/dev/root        878080 96422  781658   11% /
tmpfs            116315     2  116313    1% /dev/shm
tmpfs            819200   733  818467    1% /run
efivarfs              0     0       0     - /sys/firmware/efi/efivars
tmpfs           1048576    16 1048560    1% /tmp
none               1024     1    1023    1% /run/credentials/systemd-journald.service
none               1024     1    1023    1% /run/credentials/systemd-resolved.service
/dev/nvme0n1p13   65536   647   64889    1% /boot
/dev/nvme0n1p15       0     0       0     - /boot/efi
none               1024     1    1023    1% /run/credentials/systemd-networkd.service
none               1024     1    1023    1% /run/credentials/getty@tty1.service
none               1024     1    1023    1% /run/credentials/serial-getty@ttyS0.service
tmpfs             23263    35   23228    1% /run/user/1000
ubuntu@ip-172-31-32-139:~$ top

top - 13:51:38 up 2 min,  1 user,  load average: 0.02, 0.03, 0.00
Tasks: 117 total,   1 running, 116 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :    908.7 total,    429.6 free,    308.3 used,    279.3 buff/cache     
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    600.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                             
      1 root      20   0   24784  15424  10844 S   0.0   1.7   0:01.43 systemd                                             
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd                                            
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_workqueue_release                              
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-rcu_gp                                    
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-sync_wq                                   
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-kvfree_rcu_reclaim                        
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-slub_flushwq                              
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-netns                                     
      9 root      20   0       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0-rcu_gp                                  
     10 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0H-kblockd                                
     11 root      20   0       0      0      0 I   0.0   0.0   0:00.03 kworker/0:1-inode_switch_wbs                        
     12 root      20   0       0      0      0 I   0.0   0.0   0:00.06 kworker/u8:0-events_unbound                         
     13 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-mm_percpu_wq                              
     14 root      20   0       0      0      0 S   0.0   0.0   0:00.00 ksoftirqd/0                                         
     15 root      20   0       0      0      0 I   0.0   0.0   0:00.03 rcu_sched                                           
     16 root      20   0       0      0      0 S   0.0   0.0   0:00.00 rcu_exp_par_gp_kthread_worker/0                     
     17 root      20   0       0      0      0 S   0.0   0.0   0:00.00 rcu_exp_gp_kthread_worker                           
     18 root      rt   0       0      0      0 S   0.0   0.0   0:00.00 migration/0                                         
     19 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kprobe-optimizer                                    
     20 root     -51   0       0      0      0 S   0.0   0.0   0:00.00 idle_inject/0                                       
     21 root      20   0       0      0      0 S   0.0   0.0   0:00.00 cpuhp/0                                             
     22 root      20   0       0      0      0 S   0.0   0.0   0:00.00 cpuhp/1                                             
     23 root     -51   0       0      0      0 S   0.0   0.0   0:00.00 idle_inject/1                                       
     24 root      rt   0       0      0      0 S   0.0   0.0   0:00.00 migration/1                                         
     25 root      20   0       0      0      0 S   0.0   0.0   0:00.00 ksoftirqd/1                                         
     26 root      20   0       0      0      0 I   0.0   0.0   0:00.00 kworker/1:0-cgroup_free                             
     27 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/1:0H-kblockd                                
     28 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kdevtmpfs                                           
     29 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-inet_frag_wq                              
     30 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_kthread                                   
     31 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_rude_kthread                              
ubuntu@ip-172-31-32-139:~$ systemctl status nginx
Unit nginx.service could not be found.
ubuntu@ip-172-31-32-139:~$ systemctl status docker
Unit docker.service could not be found.
ubuntu@ip-172-31-32-139:~$ sudo nano /etc/systemd/system/exam-test.service
ubuntu@ip-172-31-32-139:~$ sudo systemctl daemon-reload
sudo systemctl start exam-test.service
ubuntu@ip-172-31-32-139:~$ systemctl status exam-test.service 
× exam-test.service - Exam Test Service
     Loaded: loaded (/etc/systemd/system/exam-test.service; disabled; preset: enabled)
     Active: failed (Result: exit-code) since Fri 2026-09-25 13:52:52 UTC; 26s ago
   Duration: 13ms
 Invocation: 67c0d432b03a4adf95deda8456943124
    Process: 1397 ExecStart=/does/not/exist (code=exited, status=203/EXEC)
   Main PID: 1397 (code=exited, status=203/EXEC)
   Mem peak: 1.7M
        CPU: 7ms

Sep 25 13:52:52 ip-172-31-32-139 systemd[1]: Started exam-test.service - Exam Test Service.
Sep 25 13:52:52 ip-172-31-32-139 (exist)[1397]: exam-test.service: Unable to locate executable '/does/not/exist': No such f>
Sep 25 13:52:52 ip-172-31-32-139 (exist)[1397]: exam-test.service: Failed at step EXEC spawning /does/not/exist: No such fi>
Sep 25 13:52:52 ip-172-31-32-139 systemd[1]: exam-test.service: Main process exited, code=exited, status=203/EXEC
Sep 25 13:52:52 ip-172-31-32-139 systemd[1]: exam-test.service: Failed with result 'exit-code'.

ubuntu@ip-172-31-32-139:~$ journalctl -u exam-test.service --since "5 minutes ago"
Sep 25 13:52:52 ip-172-31-32-139 systemd[1]: Started exam-test.service - Exam Test Service.
Sep 25 13:52:52 ip-172-31-32-139 (exist)[1397]: exam-test.service: Unable to locate executable '/does/not/exist': No such f>
Sep 25 13:52:52 ip-172-31-32-139 (exist)[1397]: exam-test.service: Failed at step EXEC spawning /does/not/exist: No such fi>
Sep 25 13:52:52 ip-172-31-32-139 systemd[1]: exam-test.service: Main process exited, code=exited, status=203/EXEC
Sep 25 13:52:52 ip-172-31-32-139 systemd[1]: exam-test.service: Failed with result 'exit-code'.

ubuntu@ip-172-31-32-139:~$ ps -eo pid,state,cmd | awk '$2 ~ /D/'
ubuntu@ip-172-31-32-139:~$ iostat -xz 1
Linux 7.0.0-1006-aws (ip-172-31-32-139) 	09/25/26 	_x86_64_	(2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           1.23    0.02    0.99    0.32    0.13   97.30

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
loop0            0.13      1.65     0.00   0.00    0.60    12.51    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.01
loop1            0.38     10.65     0.00   0.00    0.45    28.02    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.02
loop2            0.13      0.89     0.00   0.00    0.54     6.68    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.01
loop3            0.41     10.70     0.00   0.00    0.08    26.02    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
nvme0n1         21.20    645.93    15.13  41.64    0.76    30.47    7.51    171.96     9.33  55.39    1.13    22.89    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.02   1.12


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.50    0.00    0.00   99.50

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.50   99.50

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util


avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util

q
avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    0.00    0.00    0.00  100.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util

^Z
[1]+  Stopped                    iostat -xz 1
ubuntu@ip-172-31-32-139:~$ sudo lsof +L1
ubuntu@ip-172-31-32-139:~$ ps -eo pid,state,cmd
    PID S CMD
      1 S /sbin/init
      2 S [kthreadd]
      3 S [pool_workqueue_release]
      4 I [kworker/R-rcu_gp]
      5 I [kworker/R-sync_wq]
      6 I [kworker/R-kvfree_rcu_reclaim]
      7 I [kworker/R-slub_flushwq]
      8 I [kworker/R-netns]
     10 I [kworker/0:0H-kblockd]
     11 I [kworker/0:1-cgroup_release]
     12 I [kworker/u8:0-flush-259:0]
     13 I [kworker/R-mm_percpu_wq]
     14 S [ksoftirqd/0]
     15 I [rcu_sched]
     16 S [rcu_exp_par_gp_kthread_worker/0]
     17 S [rcu_exp_gp_kthread_worker]
     18 S [migration/0]
     19 S [kprobe-optimizer]
     20 S [idle_inject/0]
     21 S [cpuhp/0]
     22 S [cpuhp/1]
     23 S [idle_inject/1]
     24 S [migration/1]
     25 S [ksoftirqd/1]
     26 I [kworker/1:0-cgroup_free]
     27 I [kworker/1:0H-kblockd]
     28 S [kdevtmpfs]
     29 I [kworker/R-inet_frag_wq]
     30 I [rcu_tasks_kthread]
     31 I [rcu_tasks_rude_kthread]
     32 S [kauditd]
     33 S [khungtaskd]
     34 I [kworker/u8:1-events_unbound]
     35 S [oom_reaper]
     36 I [kworker/R-writeback]
     37 I [kworker/u8:2-events_unbound]
     38 S [kcompactd0]
     39 S [ksmd]
     40 S [khugepaged]
     41 I [kworker/R-kblockd]
     42 I [kworker/R-blkcg_punt_bio]
     43 I [kworker/R-kintegrityd]
     44 S [irq/9-acpi]
     45 I [kworker/1:1-events]
     46 I [kworker/R-tpm_dev_wq]
     47 I [kworker/R-ata_sff]
     48 I [kworker/R-md_bitmap]
     49 I [kworker/R-md_llbitmap_io]
     50 I [kworker/R-md_llbitmap_unplug]
     51 I [kworker/R-md]
     52 I [kworker/R-edac-poller]
     53 I [kworker/R-devfreq_wq]
     54 S [watchdogd]
     55 I [kworker/R-quota_events_unbound]
     56 S [kswapd0]
     57 S [ecryptfs-kthread]
     58 I [kworker/R-kthrotld]
     59 I [kworker/R-acpi_thermal_pm]
     60 I [kworker/R-nvme-wq]
     61 I [kworker/R-nvme-reset-wq]
     62 I [kworker/R-nvme-delete-wq]
     63 I [kworker/R-nvme-auth-wq]
     64 I [kworker/0:2-events]
     65 I [kworker/R-mld]
     66 I [kworker/R-ipv6_addrconf]
     67 I [kworker/R-kstrp]
     69 I [kworker/u9:0]
     80 I [kworker/R-charger_manager]
     81 S [jbd2/nvme0n1p1-8]
     82 I [kworker/R-ext4-rsv-conversion]
    117 I [kworker/0:1H-kblockd]
    129 S /usr/lib/systemd/systemd-journald
    146 I [kworker/R-kmpathd]
    149 I [kworker/R-kmpath_handlerd]
    153 I [kworker/u8:3-events_unbound]
    178 S /usr/sbin/multipathd -d -s
    182 S /usr/lib/systemd/systemd-resolved
    195 S /usr/lib/systemd/systemd-udevd
    199 S [psimon]
    252 I [kworker/R-ena]
    254 I [kworker/R-nfit]
    266 I [kworker/u8:4-events_power_efficient]
    287 S [jbd2/nvme0n1p13-8]
    288 I [kworker/R-ext4-rsv-conversion]
    515 I [kworker/1:1H-kblockd]
    518 I [kworker/R-cfg80211]
    536 S /usr/lib/systemd/systemd-networkd
    578 S /usr/sbin/acpid
    580 S /bin/sh /usr/lib/systemd/scripts/chronyd-starter.sh -n -F 1
    582 S /usr/sbin/cron -f -P
    583 S @dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
    595 S /usr/sbin/irqbalance
    598 S /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
    599 S /usr/lib/polkit-1/polkitd --no-debug --log-level=notice
    606 S /usr/lib/snapd/snapd
    611 S /usr/lib/systemd/systemd-logind
    616 S /usr/libexec/udisks2/udisksd
    658 S sshd: /usr/sbin/sshd -D -o AuthorizedKeysCommand /usr/share/ec2-instance-connect/eic_run_authorized_keys %u %f -o 
    662 S /usr/sbin/agetty --noreset --noclear --issue-file=/etc/issue:/etc/issue.d:/run/issue.d:/usr/lib/issue.d --keep-bau
    680 S /usr/sbin/agetty --noreset --noclear --issue-file=/etc/issue:/etc/issue.d:/run/issue.d:/usr/lib/issue.d - linux
    710 S /usr/sbin/chronyd -n -F 1
    713 S /usr/sbin/chronyd -n -F 1
    719 S /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
    764 S /usr/sbin/ModemManager
    826 S /usr/sbin/rsyslogd -n -iNONE
   1014 S sshd-session: ubuntu [priv]
   1021 S /usr/lib/systemd/systemd --user
   1023 S (sd-pam)
   1140 S sshd-session: ubuntu@pts/0
   1143 S -bash
   1776 I [kworker/u8:5]
   1892 S [psimon]
   1894 S /snap/amazon-ssm-agent/13349/amazon-ssm-agent
   1917 I [kworker/0:0-cgroup_free]
   1940 T iostat -xz 1
   1964 I [kworker/1:2]
   1970 R ps -eo pid,state,cmd
ubuntu@ip-172-31-32-139:~$ sudo lsof +L1
ubuntu@ip-172-31-32-139:~$ du
12	./cloud
8	./.ssh
4	./.cache
8	./Devops
4	./.config/procps
8	./.config
72	.
ubuntu@ip-172-31-32-139:~$ du -a
4	./cloud/myfile.txt
4	./cloud/demofile.txt
12	./cloud
4	./myfile.txt
4	./demofile.txt
4	./.ssh/authorized_keys
8	./.ssh
4	./.lesshst
0	./.cache/motd.legal-displayed
4	./.cache
4	./.bashrc
4	./Devops/demofile.txt
8	./Devops
4	./.bash_history
0	./softliii
4	./.config/procps
8	./.config
4	./.profile
4	./.bash_logout
72	.
ubuntu@ip-172-31-32-139:~$ dig +short www.google.com
142.251.153.119
142.251.156.119
142.251.154.119
142.251.150.119
142.251.152.119
142.251.155.119
142.251.157.119
142.251.151.119
ubuntu@ip-172-31-32-139:~$ ns lookup www.google.com
Command 'ns' not found, but can be installed with:
sudo apt install ns2
ubuntu@ip-172-31-32-139:~$ sudo apt install ns2
Error: Unable to locate package ns2
ubuntu@ip-172-31-32-139:~$ sudo apt-get install ns2
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package ns2
ubuntu@ip-172-31-32-139:~$ ns lookup www.google.com
Command 'ns' not found, but can be installed with:
sudo apt install ns2
ubuntu@ip-172-31-32-139:~$ sudo apt-get update
Hit:1 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute InRelease
Get:2 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates InRelease [137 kB]
Get:3 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports InRelease [137 kB]
Get:4 http://security.ubuntu.com/ubuntu resolute-security InRelease [137 kB]
Get:5 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/universe amd64v3 Packages [16.3 MB]
Get:6 http://security.ubuntu.com/ubuntu resolute-security/main amd64v3 Packages [527 kB]
Get:7 http://security.ubuntu.com/ubuntu resolute-security/main Translation-en [123 kB]
Get:8 http://security.ubuntu.com/ubuntu resolute-security/main amd64 Components [46.7 kB]        
Get:9 http://security.ubuntu.com/ubuntu resolute-security/main amd64 c-n-f Metadata [4616 B]   
Get:10 http://security.ubuntu.com/ubuntu resolute-security/universe amd64v3 Packages [178 kB]
Get:11 http://security.ubuntu.com/ubuntu resolute-security/universe Translation-en [56.3 kB]
Get:12 http://security.ubuntu.com/ubuntu resolute-security/universe amd64 Components [43.5 kB]
Get:13 http://security.ubuntu.com/ubuntu resolute-security/universe amd64 c-n-f Metadata [3552 B]    
Get:14 http://security.ubuntu.com/ubuntu resolute-security/restricted amd64v3 Packages [437 kB]      
Get:15 http://security.ubuntu.com/ubuntu resolute-security/restricted Translation-en [86.2 kB]       
Get:16 http://security.ubuntu.com/ubuntu resolute-security/multiverse amd64v3 Packages [10.9 kB]   
Get:17 http://security.ubuntu.com/ubuntu resolute-security/multiverse Translation-en [2844 B]
Get:18 http://security.ubuntu.com/ubuntu resolute-security/multiverse amd64 Components [212 B]
Get:19 http://security.ubuntu.com/ubuntu resolute-security/multiverse amd64 c-n-f Metadata [120 B]
Get:20 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/universe Translation-en [6329 kB]
Get:21 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/universe amd64 Components [4556 kB]
Get:22 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/universe amd64 c-n-f Metadata [313 kB]
Get:23 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/multiverse amd64v3 Packages [291 kB]
Get:24 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/multiverse Translation-en [127 kB]
Get:25 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/multiverse amd64 Components [50.0 kB]
Get:26 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/multiverse amd64 c-n-f Metadata [8276 B]
Get:27 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/main amd64v3 Packages [675 kB]
Get:28 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/main Translation-en [159 kB]
Get:29 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/main amd64 Components [97.8 kB]
Get:30 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/main amd64 c-n-f Metadata [5756 B]
Get:31 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/universe amd64v3 Packages [303 kB]
Get:32 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/universe Translation-en [96.7 kB]
Get:33 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/universe amd64 Components [190 kB]
Get:34 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/universe amd64 c-n-f Metadata [4704 B]
Get:35 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/restricted amd64v3 Packages [458 kB]
Get:36 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/restricted Translation-en [90.8 kB]
Get:37 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/multiverse amd64v3 Packages [11.6 kB]
Get:38 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/multiverse Translation-en [3172 B]
Get:39 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/multiverse amd64 Components [216 B]
Get:40 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-updates/multiverse amd64 c-n-f Metadata [256 B]
Get:41 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/main amd64 Components [212 B]
Get:42 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/main amd64 c-n-f Metadata [112 B]
Get:43 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/universe amd64v3 Packages [3148 B]
Get:44 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/universe Translation-en [7988 B]
Get:45 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/universe amd64 Components [1056 B]
Get:46 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/universe amd64 c-n-f Metadata [116 B]
Get:47 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/restricted amd64 Components [216 B]
Get:48 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/restricted amd64 c-n-f Metadata [120 B]
Get:49 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/multiverse amd64 Components [216 B]
Get:50 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute-backports/multiverse amd64 c-n-f Metadata [120 B]
Fetched 32.0 MB in 4s (7947 kB/s)               
Reading package lists... Done
ubuntu@ip-172-31-32-139:~$ ns lookup www.google.com
Command 'ns' not found, but can be installed with:
sudo apt install ns2
ubuntu@ip-172-31-32-139:~$ sudo apt-get install ns2
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Solving dependencies... Done
The following additional packages will be installed:
  fontconfig-config fonts-dejavu-core fonts-dejavu-mono libfontconfig1 libotcl1 libtclcl1 libtk8.6 libxft2 libxrender1
  libxss1 x11-common
Suggested packages:
  tk8.6 gnuplot ns2-examples
The following NEW packages will be installed:
  fontconfig-config fonts-dejavu-core fonts-dejavu-mono libfontconfig1 libotcl1 libtclcl1 libtk8.6 libxft2 libxrender1
  libxss1 ns2 x11-common
0 upgraded, 12 newly installed, 0 to remove and 184 not upgraded.
Need to get 5019 kB of archives.
After this operation, 22.5 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 fonts-dejavu-mono all 2.37-8build1 [502 kB]
Get:2 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 fonts-dejavu-core all 2.37-8build1 [834 kB]
Get:3 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 fontconfig-config amd64 2.17.1-3ubuntu1 [38.5 kB]
Get:4 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 libfontconfig1 amd64 2.17.1-3ubuntu1 [145 kB]
Get:5 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/universe amd64v3 libotcl1 amd64 1.14+dfsg-9 [24.1 kB]
Get:6 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/universe amd64v3 libtclcl1 amd64 1.20-14 [66.4 kB]
Get:7 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 libxrender1 amd64 1:0.9.12-1build1 [19.6 kB]
Get:8 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 libxft2 amd64 2.3.6-1build2 [45.6 kB]
Get:9 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 x11-common all 1:7.7+26ubuntu1 [22.5 kB]
Get:10 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 libxss1 amd64 1:1.2.3-1build4 [7182 B]
Get:11 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/main amd64v3 libtk8.6 amd64 8.6.17-1build1 [796 kB]
Get:12 http://eu-west-1.ec2.archive.ubuntu.com/ubuntu resolute/universe amd64v3 ns2 amd64 2.35+dfsg-9build1 [2518 kB]
Fetched 5019 kB in 0s (43.8 MB/s)
Selecting previously unselected package fonts-dejavu-mono.
(Reading database ... 85303 files and directories currently installed.)
Preparing to unpack .../00-fonts-dejavu-mono_2.37-8build1_all.deb ...
Unpacking fonts-dejavu-mono (2.37-8build1) ...
Selecting previously unselected package fonts-dejavu-core.
Preparing to unpack .../01-fonts-dejavu-core_2.37-8build1_all.deb ...
Unpacking fonts-dejavu-core (2.37-8build1) ...
Selecting previously unselected package fontconfig-config.
Preparing to unpack .../02-fontconfig-config_2.17.1-3ubuntu1_amd64v3.deb ...
Unpacking fontconfig-config (2.17.1-3ubuntu1) ...
Selecting previously unselected package libfontconfig1:amd64.
Preparing to unpack .../03-libfontconfig1_2.17.1-3ubuntu1_amd64v3.deb ...
Unpacking libfontconfig1:amd64 (2.17.1-3ubuntu1) ...
Selecting previously unselected package libotcl1:amd64.
Preparing to unpack .../04-libotcl1_1.14+dfsg-9_amd64v3.deb ...
Unpacking libotcl1:amd64 (1.14+dfsg-9) ...
Selecting previously unselected package libtclcl1:amd64.
Preparing to unpack .../05-libtclcl1_1.20-14_amd64v3.deb ...
Unpacking libtclcl1:amd64 (1.20-14) ...
Selecting previously unselected package libxrender1:amd64.
Preparing to unpack .../06-libxrender1_1%3a0.9.12-1build1_amd64v3.deb ...
Unpacking libxrender1:amd64 (1:0.9.12-1build1) ...
Selecting previously unselected package libxft2:amd64.
Preparing to unpack .../07-libxft2_2.3.6-1build2_amd64v3.deb ...
Unpacking libxft2:amd64 (2.3.6-1build2) ...
Selecting previously unselected package x11-common.
Preparing to unpack .../08-x11-common_1%3a7.7+26ubuntu1_all.deb ...
Unpacking x11-common (1:7.7+26ubuntu1) ...
Selecting previously unselected package libxss1:amd64.
Preparing to unpack .../09-libxss1_1%3a1.2.3-1build4_amd64v3.deb ...
Unpacking libxss1:amd64 (1:1.2.3-1build4) ...
Selecting previously unselected package libtk8.6:amd64.
Preparing to unpack .../10-libtk8.6_8.6.17-1build1_amd64v3.deb ...
Unpacking libtk8.6:amd64 (8.6.17-1build1) ...
Selecting previously unselected package ns2.
Preparing to unpack .../11-ns2_2.35+dfsg-9build1_amd64v3.deb ...
Unpacking ns2 (2.35+dfsg-9build1) ...
Setting up libotcl1:amd64 (1.14+dfsg-9) ...
Setting up libxrender1:amd64 (1:0.9.12-1build1) ...
Setting up libtclcl1:amd64 (1.20-14) ...
Setting up x11-common (1:7.7+26ubuntu1) ...
Setting up fonts-dejavu-mono (2.37-8build1) ...
Setting up fonts-dejavu-core (2.37-8build1) ...
Setting up libxss1:amd64 (1:1.2.3-1build4) ...
Setting up fontconfig-config (2.17.1-3ubuntu1) ...
Processing triggers for libc-bin (2.43-2ubuntu2) ...
Processing triggers for man-db (2.13.1-1build1) ...
Processing triggers for sgml-base (1.31+nmu1build1) ...
Setting up libfontconfig1:amd64 (2.17.1-3ubuntu1) ...
Setting up libxft2:amd64 (2.3.6-1build2) ...
Setting up libtk8.6:amd64 (8.6.17-1build1) ...
Setting up ns2 (2.35+dfsg-9build1) ...
Processing triggers for libc-bin (2.43-2ubuntu2) ...
Scanning processes...                                                                                                       
Scanning linux images...                                                                                                    

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@ip-172-31-32-139:~$ ns lookup www.google.com
couldn't read file "lookup": no such file or directory
ubuntu@ip-172-31-32-139:~$ nslookup www.google.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	www.google.com
Address: 142.251.150.119
Name:	www.google.com
Address: 142.251.155.119
Name:	www.google.com
Address: 142.251.152.119
Name:	www.google.com
Address: 142.251.156.119
Name:	www.google.com
Address: 142.251.151.119
Name:	www.google.com
Address: 142.251.157.119
Name:	www.google.com
Address: 142.251.154.119
Name:	www.google.com
Address: 142.251.153.119
Name:	www.google.com
Address: 2001:4860:4828:7700::
Name:	www.google.com
Address: 2001:4860:482c:7700::
Name:	www.google.com
Address: 2001:4860:482b:7700::
Name:	www.google.com
Address: 2001:4860:4829:7700::
Name:	www.google.com
Address: 2001:4860:482a:7700::
Name:	www.google.com
Address: 2001:4860:4827:7700::
Name:	www.google.com
Address: 2001:4860:482d:7700::
Name:	www.google.com
Address: 2001:4860:4826:7700::

ubuntu@ip-172-31-32-139:~$ ip route get 8.8.8.8
8.8.8.8 via 172.31.32.1 dev ens5 src 172.31.32.139 uid 1000 
    cache 
ubuntu@ip-172-31-32-139:~$ ip route get 10.20.0.15
10.20.0.15 via 172.31.32.1 dev ens5 src 172.31.32.139 uid 1000 
    cache 
ubuntu@ip-172-31-32-139:~$ ss -tulpn
Netid      State       Recv-Q      Send-Q                Local Address:Port             Peer Address:Port      Process      
udp        UNCONN      0           0                         127.0.0.1:323                   0.0.0.0:*                      
udp        UNCONN      0           0                        127.0.0.54:53                    0.0.0.0:*                      
udp        UNCONN      0           0                     127.0.0.53%lo:53                    0.0.0.0:*                      
udp        UNCONN      0           0                172.31.32.139%ens5:68                    0.0.0.0:*                      
udp        UNCONN      0           0                             [::1]:323                      [::]:*                      
tcp        LISTEN      0           4096                  127.0.0.53%lo:53                    0.0.0.0:*                      
tcp        LISTEN      0           4096                        0.0.0.0:22                    0.0.0.0:*                      
tcp        LISTEN      0           4096                     127.0.0.54:53                    0.0.0.0:*                      
tcp        LISTEN      0           4096                           [::]:22                       [::]:*                      
ubuntu@ip-172-31-32-139:~$ ss -ltnp
State         Recv-Q        Send-Q               Local Address:Port                 Peer Address:Port        Process        
LISTEN        0             4096                 127.0.0.53%lo:53                        0.0.0.0:*                          
LISTEN        0             4096                       0.0.0.0:22                        0.0.0.0:*                          
LISTEN        0             4096                    127.0.0.54:53                        0.0.0.0:*                          
LISTEN        0             4096                          [::]:22                           [::]:*                          
ubuntu@ip-172-31-32-139:~$ nc -vz example.com 443
Connection to example.com (172.66.147.243) 443 port [tcp/https] succeeded!
ubuntu@ip-172-31-32-139:~$ curl -v https://example.com
* Host example.com:443 was resolved.
* IPv6: 2606:4700:10::6814:179a, 2606:4700:10::ac42:93f3
* IPv4: 104.20.23.154, 172.66.147.243
*   Trying [2606:4700:10::6814:179a]:443...
* Immediate connect fail for 2606:4700:10::6814:179a: Network is unreachable
*   Trying 104.20.23.154:443...
* ALPN: curl offers h2,http/1.1
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* SSL Trust Anchors:
*   CAfile: /etc/ssl/certs/ca-certificates.crt
*   CApath: /etc/ssl/certs
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384 / X25519MLKEM768 / id-ecPublicKey
* ALPN: server accepted h2
* Server certificate:
*   subject: CN=example.com
*   start date: Jul 29 22:10:08 2026 GMT
*   expire date: Oct 27 22:17:21 2026 GMT
*   issuer: C=US; O=SSL Corporation; CN=Cloudflare TLS Issuing ECC CA 3
*   Certificate level 0: Public key type EC/prime256v1 (256/128 Bits/secBits), signed using ecdsa-with-SHA256
*   Certificate level 1: Public key type EC/prime256v1 (256/128 Bits/secBits), signed using ecdsa-with-SHA384
*   Certificate level 2: Public key type EC/secp384r1 (384/192 Bits/secBits), signed using ecdsa-with-SHA384
*   Certificate level 3: Public key type EC/secp384r1 (384/192 Bits/secBits), signed using ecdsa-with-SHA384
*   subjectAltName: "example.com" matches cert's "example.com"
* SSL certificate verified via OpenSSL.
* Established connection to example.com (104.20.23.154 port 443) from 172.31.32.139 port 43716 
* using HTTP/2
* [HTTP/2] [1] OPENED stream for https://example.com/
* [HTTP/2] [1] [:method: GET]
* [HTTP/2] [1] [:scheme: https]
* [HTTP/2] [1] [:authority: example.com]
* [HTTP/2] [1] [:path: /]
* [HTTP/2] [1] [user-agent: curl/8.18.0]
* [HTTP/2] [1] [accept: */*]
> GET / HTTP/2
> Host: example.com
> User-Agent: curl/8.18.0
> Accept: */*
> 
* Request completely sent off
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
< HTTP/2 200 
< date: Fri, 25 Sep 2026 14:13:06 GMT
< content-type: text/html
< server: cloudflare
< last-modified: Tue, 22 Sep 2026 20:16:57 GMT
< allow: GET, HEAD
< accept-ranges: bytes
< age: 9740
< cf-cache-status: HIT
< cf-ray: a40aa0ae395d23e0-DUB
< 
<!doctype html><html lang="en"><head><title>Example Domain</title><link rel="icon" href="data:,"><meta name="viewport" content="width=device-width, initial-scale=1"><style>body{background:#eee;width:60vw;margin:15vh auto;font-family:system-ui,sans-serif}h1{font-size:1.5em}div{opacity:0.8}a:link,a:visited{color:#348}</style></head><body><div><h1>Example Domain</h1><p>This domain is for use in documentation examples without needing permission. Avoid use in operations.</p><p><a href="https://iana.org/domains/example">Learn more</a></p></div></body></html>
* Connection #0 to host example.com:443 left intact
ubuntu@ip-172-31-32-139:~$ exit
logout
There are stopped jobs.
ubuntu@ip-172-31-32-139:~$ Connection to ec2-34-245-23-182.eu-west-1.compute.amazonaws.com closed by remote host.
Connection to ec2-34-245-23-182.eu-west-1.compute.amazonaws.com closed.
riyan_ahmed@Riyans-MacBook-Pro Downloads % cd ..
riyan_ahmed@Riyans-MacBook-Pro ~ % cd Documents 
riyan_ahmed@Riyans-MacBook-Pro Documents % ls
app.log					Phase1_Practical_Exam_Instructions.pdf	Shell-Scripting-For-DevOps
Debug_only.log				Res new.pdf				Work
Personal				Riyan_Ahmed_DevOps_Engineer (1).pdf
riyan_ahmed@Riyans-MacBook-Pro Documents % cd Work 
riyan_ahmed@Riyans-MacBook-Pro Work % cd Train\ with\ shubham\ /90DaysOfDevOps/2026/day-09 
riyan_ahmed@Riyans-MacBook-Pro day-09 % ls
README.md
riyan_ahmed@Riyans-MacBook-Pro day-09 % sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
Password:
sudo: useradd: command not found
sudo: useradd: command not found
sudo: useradd: command not found
riyan_ahmed@Riyans-MacBook-Pro day-09 % sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
sudo: useradd: command not found
sudo: useradd: command not found
sudo: useradd: command not found
riyan_ahmed@Riyans-MacBook-Pro day-09 % sudo useradd -m tokyo
sudo: useradd: command not found
riyan_ahmed@Riyans-MacBook-Pro day-09 % cd ..
riyan_ahmed@Riyans-MacBook-Pro 2026 % cd ..
riyan_ahmed@Riyans-MacBook-Pro 90DaysOfDevOps % cd ..
riyan_ahmed@Riyans-MacBook-Pro Train with shubham  % cd ..
riyan_ahmed@Riyans-MacBook-Pro Work % cd ..
riyan_ahmed@Riyans-MacBook-Pro Documents % cd ..
riyan_ahmed@Riyans-MacBook-Pro ~ % cd Downloads 
riyan_ahmed@Riyans-MacBook-Pro Downloads % chmod 400 "Linux-key.pem"
riyan_ahmed@Riyans-MacBook-Pro Downloads % ssh -i "Linux-key.pem" ubuntu@ec2-54-75-42-222.eu-west-1.compute.amazonaws.com
The authenticity of host 'ec2-54-75-42-222.eu-west-1.compute.amazonaws.com (54.75.42.222)' can't be established.
ED25519 key fingerprint is: SHA256:dRUw151mRW5cGEuqTaB+vJQDUD52X9bhwuOvkIpx7G0
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:33: ec2-52-213-100-50.eu-west-1.compute.amazonaws.com
    ~/.ssh/known_hosts:36: ec2-3-251-85-121.eu-west-1.compute.amazonaws.com
    ~/.ssh/known_hosts:38: ec2-34-245-23-182.eu-west-1.compute.amazonaws.com
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-54-75-42-222.eu-west-1.compute.amazonaws.com' (ED25519) to the list of known hosts.
Welcome to Ubuntu 26.04 LTS (GNU/Linux 7.0.0-1006-aws x86_64)

 * Documentation:  https://docs.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri Sep 25 14:21:53 UTC 2026

  System load:  0.11              Temperature:           -273.1 C
  Usage of /:   35.3% of 6.61GB   Processes:             120
  Memory usage: 25%               Users logged in:       0
  Swap usage:   0%                IPv4 address for ens5: 172.31.32.139


Expanded Security Maintenance for Applications is not enabled.

182 updates can be applied immediately.
145 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Fri Sep 25 13:49:35 2026 from 31.96.18.168
ubuntu@ip-172-31-32-139:~$ git clone https://github.com/riyan-ahmed/90DaysOfDevOps
Cloning into '90DaysOfDevOps'...
remote: Enumerating objects: 7022, done.
remote: Total 7022 (delta 0), reused 0 (delta 0), pack-reused 7022 (from 1)
Receiving objects: 100% (7022/7022), 85.06 MiB | 19.94 MiB/s, done.
Resolving deltas: 100% (2526/2526), done.
ubuntu@ip-172-31-32-139:~$ ls
90DaysOfDevOps  Devops  cloud  demofile.txt  myfile.txt  softliii
ubuntu@ip-172-31-32-139:~$ cd 90DaysOfDevOps/2026/day-09
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ ls
README.md
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo useradd -m tokyo
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo passwd tokyo
New password: 
Retype new password: 
passwd: password updated successfully
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo useradd -m berlin
sudo useradd -m professor
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo passwd b
backup  berlin  bin     
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo passwd b
backup  berlin  bin     
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo passwd berlin 
New password: 
Retype new password: 
passwd: password updated successfully
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo passwd pro
professor  proxy      
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo passwd professor 
New password: 
Retype new password: 
passwd: password updated successfully
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ grep -E 'tokyo|berlin|professor' /etc/passwd
tokyo:x:1001:1001::/home/tokyo:/bin/sh
berlin:x:1002:1002::/home/berlin:/bin/sh
professor:x:1003:1003::/home/professor:/bin/sh
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ ls -l /home/
total 16
drwxr-x--- 2 berlin    berlin    4096 Sep 25 14:23 berlin
drwxr-x--- 2 professor professor 4096 Sep 25 14:23 professor
drwxr-x--- 2 tokyo     tokyo     4096 Sep 25 14:22 tokyo
drwxr-x--- 8 ubuntu    ubuntu    4096 Sep 25 14:22 ubuntu
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ /etc/passwd
-bash: /etc/passwd: Permission denied
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
_apt:x:42:65534::/nonexistent:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:998:998:systemd Network Management:/:/usr/sbin/nologin
dhcpcd:x:996:996:DHCP Client Daemon:/usr/lib/dhcpcd:/bin/false
messagebus:x:995:995:System Message Bus:/nonexistent:/usr/sbin/nologin
syslog:x:100:101::/nonexistent:/usr/sbin/nologin
systemd-resolve:x:989:989:systemd Resolver:/:/usr/sbin/nologin
_chrony:x:988:988:Chrony Daemon:/var/lib/chrony:/usr/sbin/nologin
tss:x:987:987:tss user for tpm2:/:/usr/sbin/nologin
uuidd:x:101:103::/run/uuidd:/usr/sbin/nologin
sshd:x:986:65534:sshd user:/run/sshd:/usr/sbin/nologin
pollinate:x:102:1::/var/cache/pollinate:/bin/false
tcpdump:x:985:985:tcpdump:/nonexistent:/usr/sbin/nologin
landscape:x:103:106::/var/lib/landscape:/usr/sbin/nologin
fwupd-refresh:x:984:984:Firmware update daemon:/var/lib/fwupd:/usr/sbin/nologin
polkitd:x:983:983:User for polkitd:/:/usr/sbin/nologin
ec2-instance-connect:x:104:65534::/nonexistent:/usr/sbin/nologin
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
tokyo:x:1001:1001::/home/tokyo:/bin/sh
berlin:x:1002:1002::/home/berlin:/bin/sh
professor:x:1003:1003::/home/professor:/bin/sh
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ cat /etc/passwd | grep berlin/Tokyo
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ cat /etc/passwd | grep 'berlin/tokyo'
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ cat /etc/passwd | grep -E 'berlin/tokyo'
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ /etc/passwd | grep -E 'berlin/tokyo'
-bash: /etc/passwd: Permission denied
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo /etc/passwd | grep -E 'berlin/tokyo'
^[[Asudo: cannot execute '/etc/passwd': Permission denied (os error 13)
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ ls -l /home/
total 16
drwxr-x--- 2 berlin    berlin    4096 Sep 25 14:23 berlin
drwxr-x--- 2 professor professor 4096 Sep 25 14:23 professor
drwxr-x--- 2 tokyo     tokyo     4096 Sep 25 14:22 tokyo
drwxr-x--- 8 ubuntu    ubuntu    4096 Sep 25 14:22 ubuntu
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo groupadd heist
sudo groupadd police
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ grep -E 'heist|police' /etc/group
heist:x:1004:
police:x:1005:
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo usermod -aG heist tokyo
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo usermod -aG heist berlin
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo usermod -aG police professor 
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ groups tokyo
tokyo : tokyo heist
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ groups tokyo
groups berlin
groups professor
tokyo : tokyo heist
berlin : berlin heist
professor : professor police
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo mkdir -p /shared/heist
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo chown :heist /shared/heist
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo mkdir -p /shared/police
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo chown :police /shared/police
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ sudo chmod 2770 /shared/heist
sudo chmod 2770 /shared/police
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ ls -ld /shared/heist /shared/police
drwxrws--- 2 root heist  4096 Sep 25 14:31 /shared/heist
drwxrws--- 2 root police 4096 Sep 25 14:32 /shared/police
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ su - tokyo
Password: 
$ echo "Tokyo was Here" > /shared/heist/tokyo.txt
-sh: 1: cannot create /shad/heist/tokyo.txt: Directory nonexistent
$ echo "Tokyo was here" > /shared/heist/tokyo.txt
$ ls -l /shared/heist
total 4
-rw-rw-r-- 1 tokyo heist 15 Sep 25 14:34 tokyo.txt
$ cat /shared/heist/tokyo.txt
Tokyo was here
$ touch /shared/police/test.txt
touch: setting times of '/shared/police/test.txt': Permission denied
$ exit
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ su - berlin
Password: 
$ echo "Berlin was here" > /shared/heist/berlin.txt
$ çls -l /shared/heist
cat /shared/heist/tokyo.txt
cat /shared/heist/berlin.txt-sh: 2: çls: not found
$ Tokyo was here
$ ls -l /shared/heist
cat /shared/heist/tokyo.txt
cat /shared/heist/berlin.txterror: unexpected argument '-l' found

  tip: to pass '-l' as a value, use '-- -l'

Usage: cat [OPTION]... [FILE]...

For more information, try '--help'.
$ Tokyo was here
$ 
Berlin was here
$ touch /shared/police/berlin-test.txt
touch: setting times of '/shared/police/berlin-test.txt': Permission denied
$ su - professor
Password: 
$ echo "Professor was here" > /shared/police/professor.txt
$ ls -l /shared/police
cat /shared/police/professor.txttotal 4
-rw-rw-r-- 1 professor police 19 Sep 25 14:39 professor.txt
$ 
Professor was here
$ touch /shared/heist/professor-test.txt
touch: setting times of '/shared/heist/professor-test.txt': Permission denied
$ exit
$ exit
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ id tokyo
id berlin
id professor

ls -ld /shared/heist /shared/police
ls -l /shared/heist
ls -l /shared/police
uid=1001(tokyo) gid=1001(tokyo) groups=1001(tokyo),1004(heist)
uid=1002(berlin) gid=1002(berlin) groups=1002(berlin),1004(heist)
uid=1003(professor) gid=1003(professor) groups=1003(professor),1005(police)
drwxrws--- 2 root heist  4096 Sep 25 14:38 /shared/heist
drwxrws--- 2 root police 4096 Sep 25 14:39 /shared/police
ls: cannot open directory '/shared/heist': Permission denied
ls: cannot open directory '/shared/police': Permission denied
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ als
Command 'als' not found, but can be installed with:
sudo apt install atool
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ ls
README.md
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ 
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ # Day 09 – Linux User and Group Management

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
id                                                    ls



























































































































































































































































                                                      ls





































ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ # Day 09 – Linux User and Group Management

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
id                                                    ls



























































































































































































































































                                                        clear
lsclear: command not found
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ ;s
-bash: syntax error near unexpected token `;'
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ vim README.md
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ vim README.md 
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ rm README.md 
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ vim README.md 
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ mv README.md CHALLENGE.md
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ vim README.md 
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ git add .
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ git commit -m "added Day09"
[master 59e0c4b] added Day09
 Committer: Ubuntu <ubuntu@ip-172-31-32-139.eu-west-1.compute.internal>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 2 files changed, 376 insertions(+), 89 deletions(-)
 create mode 100644 2026/day-09/CHALLENGE.md
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ git push origin master
Username for 'https://github.com': https://github.com/riyan-ahmed 
Password for 'https://https%3A%2F%2Fgithub.com%2Friyan-ahmed@github.com': 
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed for 'https://github.com/riyan-ahmed/90DaysOfDevOps/'
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ git push origin master
Username for 'https://github.com': https://github.com/riyan-ahmed
Password for 'https://https%3A%2F%2Fgithub.com%2Friyan-ahmed@github.com': 
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed for 'https://github.com/riyan-ahmed/90DaysOfDevOps/'
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ git login
git: 'login' is not a git command. See 'git --help'.

The most similar command is
	column
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ git --help
usage: git [-v | --version] [-h | --help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--no-lazy-fetch]
           [--no-optional-locks] [--no-advice] [--bare] [--git-dir=<path>]
           [--work-tree=<path>] [--namespace=<name>] [--config-env=<name>=<envvar>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone      Clone a repository into a new directory
   init       Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add        Add file contents to the index
   mv         Move or rename a file, a directory, or a symlink
   restore    Restore working tree files
   rm         Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect     Use binary search to find the commit that introduced a bug
   diff       Show changes between commits, commit and working tree, etc
   grep       Print lines matching a pattern
   log        Show commit logs
   show       Show various types of objects
   status     Show the working tree status

grow, mark and tweak your common history
   backfill   Download missing objects in a partial clone
   branch     List, create, or delete branches
   commit     Record changes to the repository
   merge      Join two or more development histories together
   rebase     Reapply commits on top of another base tip
   reset      Set `HEAD` or the index to a known state
   switch     Switch branches
   tag        Create, list, delete or verify tags

collaborate (see also: git help workflows)
   fetch      Download objects and refs from another repository
   pull       Fetch from and integrate with another repository or a local branch
   push       Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
See 'git help git' for an overview of the system.
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ Vim README.md 
Command 'Vim' not found, did you mean:
  command 'nim' from deb nim (2.2.4-2)
  command 'zim' from deb zim (0.76.3-2)
  command 'fim' from deb fim (0.6~rc2-1build2)
  command 'vim' from deb vim (2:9.1.2141-1ubuntu4.6)
  command 'vim' from deb vim-gtk3 (2:9.1.2141-1ubuntu4.6)
  command 'vim' from deb vim-motif (2:9.1.2141-1ubuntu4.6)
  command 'vim' from deb vim-nox (2:9.1.2141-1ubuntu4.6)
  command 'vim' from deb neovim (0.11.6-1)
Try: sudo apt install <deb name>
ubuntu@ip-172-31-32-139:~/90DaysOfDevOps/2026/day-09$ vim README.md 

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
"README.md" 287L, 4223B                                                                                   283,79        Bot
