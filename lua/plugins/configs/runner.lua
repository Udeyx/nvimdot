local present, runner = pcall(require, 'code_runner')

if not present then
    print 'code_runner not found, please install it'
    return
end

local options = {
    startinsert = true,
    filetype = {
        c = 'cd $dir && gcc $fileName -o $fileNameWithoutExt -g -Wall -lm && $dir/$fileNameWithoutExt',
        cpp = 'cd $dir && g++ $fileName -o $fileNameWithoutExt -g -Wall -lm && $dir/$fileNameWithoutExt',
        java = 'cd $dir && javac $fileName && java $fileNameWithoutExt',
        python = 'python3 -u',
        typescript = 'deno run',
        lua = 'lua',
        rust = 'cd $dir && rustc $fileName && $dir/$fileNameWithoutExt',
        latex = 'xelatex',
        plaintex = 'xelatex',
    },
}

runner.setup(options)
