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
