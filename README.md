# 🚀 Fawry Internship Task 

## ❓ Q1: Custom Command (`mygrep.sh`)

### 📝 Reflective Section

#### 1. How does your script handle arguments and options?

##### 🎯 **Argument:**
- The script checks if there are at least two remaining arguments after processing the options:
  - **`search_word`**: The text to search for.
  - **`filename`**: The file to search in.

##### ⚙️ **Option:**
- Each option starting with `-` is processed using `getopts`:
  - **`-v`**: Inverts the match (prints lines that do not contain the search string).
  - **`-n`**: Shows the line number before the matching text.
  
- The script allows options to be written in different formats:
  - **Together**: `-vn`.
  - **Separate**: `-v -n`.
  - **In any order**: `-v -n` or `-n -v`.

##### 🔄 **How Options Work Together:**
- If the user uses `-vn` or `-nv`, both options (`-n` and `-v`) will be activated, regardless of the order.

#### 2. Supporting Regex or Additional Options (`-i`, `-c`, `-l`):

- To add features like regex, **`-i`** (case-insensitive), **`-c`** (count matches), and **`-l`** (list file names with matches), the script needs some changes:
  - **Regex Support**: Use `grep -E` to support regular expressions and allow pattern-based searches.
  - **`-i`** (Case-Insensitive): Modify the script to handle case-insensitive searches by adding `-i` in `grep`.
  - **`-c`** (Count Matches): Instead of showing matching lines, print the total number of matches.
  - **`-l`** (List File Names): Show only file names that have matches, not the matching lines.

#### 3. 🏆 Most Challenging Part of Script Implementation:

- The hardest part of the script was handling combined options (like `-vn` and `-nv`) and making sure the script processes them correctly. Options can be written together or separately, so it was important to ensure the script handles them the same way regardless of the order.

##### ❓ **Why was this challenging?**
- Users might mix up the order or combine options in unexpected ways.
- It was essential to ensure the script handles these cases without errors or surprises.

##### 🛠️ **How was this handled?**
- `getopts` was used to process the options, ensuring consistent behavior whether options are combined or separate.
- The script also checks for missing search strings and filenames and provides clear error messages when needed.

## ❓ Q2 : Scenario
### 🛠️ Internal Service DNS/Network Troubleshooting Report
###### 📍 Scenario
- The internal service `internal.example.com` is unreachable.
- Users are seeing “host not found” errors.
- Task is to troubleshoot, verify, and restore access.
##### 1. Verify DNS Resolution
##### Commands Used:
```bash
nslookup internal.example.com
nslookup internal.example.com 8.8.8.8

```
- We found that the server can't be reached using DNS or 8.8.8.8 , then start to apply temporary solution
##### 🔧 Temporary Solution:
- Added a manual entry to /etc/hosts file:
```
127.0.0.1       internal.example.com
```
- After modification, the /etc/hosts file looks like:
```
127.0.0.1       localhost
127.0.1.1       waheed
127.0.0.1       internal.example.com
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
#### 2. Test Local DNS Resolution
##### 🖱️ Command:
```
ping internal.example.com
```
##### ⏳ Output:
```
PING internal.example.com (127.0.0.1) 56(84) bytes of data.
64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.083 ms
64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.089 ms
64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.093 ms
64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.092 ms
64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.102 ms
64 bytes from localhost (127.0.0.1): icmp_seq=6 ttl=64 time=0.091 ms
```
#### 3. Test Web Service on Port 80
##### 💻 Command:
```
sudo python3 -m http.server 80
```
##### 📡 Output:
```
Serving HTTP on :: port 80 (http://[::]:80/) ...
```
#### 4. Test HTTP Response via curl
##### 🌐 Command:
```
curl http://internal.example.com
```
##### 💥 Output:
```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
<li><a href=".bash_history">.bash_history</a></li>
<li><a href=".bash_logout">.bash_logout</a></li>
<li><a href=".bashrc">.bashrc</a></li>
<li><a href=".boto">.boto</a></li>
<li><a href=".cache/">.cache/</a></li>
<li><a href=".config/">.config/</a></li>
<li><a href=".docker/">.docker/</a></li>
<li><a href=".dotnet/">.dotnet/</a></li>
<li><a href=".gitconfig">.gitconfig</a></li>
<li><a href=".gnupg/">.gnupg/</a></li>
<li><a href=".lesshst">.lesshst</a></li>
<li><a href=".local/">.local/</a></li>
<li><a href=".mysql_history">.mysql_history</a></li>
<li><a href=".pki/">.pki/</a></li>
<li><a href=".profile">.profile</a></li>
<li><a href=".ssh/">.ssh/</a></li>
<li><a href=".sudo_as_admin_successful">.sudo_as_admin_successful</a></li>
<li><a href=".terraform.d/">.terraform.d/</a></li>
<li><a href=".viminfo">.viminfo</a></li>
<li><a href=".vscode/">.vscode/</a></li>
<li><a href=".wget-hsts">.wget-hsts</a></li>
<li><a href="A_project/">A_project/</a></li>
<li><a href="Areeb/">Areeb/</a></li>
<li><a href="Areeb_tecnology/">Areeb_tecnology/</a></li>
<li><a href="Desktop/">Desktop/</a></li>
<li><a href="Documents/">Documents/</a></li>
<li><a href="Downloads/">Downloads/</a></li>
<li><a href="Music/">Music/</a></li>
<li><a href="mysqld_exporter-0.17.2.linux-amd64/">mysqld_exporter-0.17.2.linux-amd64/</a></li>
<li><a href="mysqld_exporter-0.17.2.linux-amd64.tar.gz">mysqld_exporter-0.17.2.linux-amd64.tar.gz</a></li>
<li><a href="Pictures/">Pictures/</a></li>
<li><a href="project/">project/</a></li>
<li><a href="Public/">Public/</a></li>
<li><a href="scripts/">scripts/</a></li>
<li><a href="snap/">snap/</a></li>
<li><a href="Templates/">Templates/</a></li>
<li><a href="testfile.txt">testfile.txt</a></li>
<li><a href="Videos/">Videos/</a></li>
<li><a href="website/">website/</a></li>
</ul>
<hr>
</body>
</html>
```



