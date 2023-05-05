local options = {
    filetype = {
        c = 'cd $dir && gcc -g -Wall -lm $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt',
        cpp = 'cd $dir && g++ -g -Wall -lm $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt',
        javascript = 'node',
        java = 'cd $dir && javac $fileName && java $fileNameWithoutExt',
        lua = 'lua',
        python = 'python3 -u',
        rust = 'cd $dir && rustc $fileName && $dir$fileNameWithoutExt',
        sh = 'bash',
        typescript = 'deno run',
    },
}

require('code_runner').setup(options)
