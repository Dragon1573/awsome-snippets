# BFG Repo Cleaner 补全列表

complete -c 'bfg' -d "BFG Repo Cleaner"

complete -c 'bfg' -x -s 'b' -l 'strip-blobs-bigger-than' -d "strip blobs bigger than X (eg '128K', '1M', etc)"
complete -c 'bfg' -x -s 'B' -l 'strip-biggest-blobs' -d 'strip the top NUM biggest blobs'
complete -c 'bfg' -x -o 'bi' -l 'strip-blobs-with-ids' -d 'strip blobs with the specified Git object ids'
complete -c 'bfg' -x -s 'D' -l 'delete-files' -d "delete files with the specified names (eg '*.class', '*.{txt,log}' - matches on file name, not path within repo)"
complete -c 'bfg' -x -l 'delete-folders' -d "delete folders with the specified names (eg '.svn', '*-tmp' - matches on folder name, not path within repo)"
complete -c 'bfg' -x -l 'convert-to-git-lfs' -d "extract files with the specified names (eg '*.zip' or '*.mp4') into Git LFS"
complete -c 'bfg' -x -o 'rt' -l 'replace-text' -d 'filter content of files, replacing matched text'
complete -c 'bfg' -x -o 'fi' -l 'filter-content-including' -d "do file-content filtering on files that match the specified expression (eg '*.{txt,properties}')"
complete -c 'bfg' -x -o 'fe' -l 'filter-content-excluding' -d "don't do file-content filtering on files that match the specified expression (eg '*.{xml,pdf}')"
complete -c 'bfg' -x -o 'fs' -l 'filter-content-size-threshold' -d "only do file-content filtering on files smaller than <size> (default is 1048576 bytes)"
complete -c 'bfg' -x -s 'p' -l 'protect-blobs-from' -d "protect blobs that appear in the most recent versions of the specified refs (default is 'HEAD')"
complete -c 'bfg' -x -l 'no-blob-protection' -d "allow the BFG to modify even your *latest* commit. Not recommended: you should have already ensured your latest commit is clean"
complete -c 'bfg' -x -l 'private' -d "treat this repo-rewrite as removing private data (for example: omit old commit ids from commit messages)"
complete -c 'bfg' -x -l 'massive-non-file-objects-sized-up-to' -d "increase memory usage to handle over-size Commits, Tags, and Trees that are up to X in size (eg '10M')"
