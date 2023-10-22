function file_exists(path)
    local f = io.open(path, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local function create_file()
    local word
    local start_pos, end_pos

    if vim.fn.mode() == 'v' then
        -- Get the cursor position of the start and end of the visual selection
        start_pos = vim.fn.searchpos("\\<", 'bcnW')
        end_pos = vim.fn.searchpos("\\>", 'ecnW')

        -- Get the lines of text between the start and end of the visual selection
        local lines = vim.fn.getline(start_pos[1], end_pos[1])

        -- Concatenate the lines into a single string, then extract the word(s)
        local text = table.concat(lines, " ")
        word = text:match("%S+") or ""
    else
        -- Handle the case where there is no visual selection
        word = vim.fn.expand("<cword>")
        start_pos = vim.fn.searchpos("\\<", 'bcnW')
        end_pos = vim.fn.searchpos("\\>", 'ecnW')
    end

    local filename = word .. '.md'
    local current_dir = vim.fn.expand("%:p:h") .. '/'
    local filepath = current_dir .. filename

    -- Create file
    if not file_exists(filepath) then
        local file = io.open(filepath, 'w')
        if not file then
            error("Could not create file: " .. filepath)
            return
        end
        file:write("# " .. word .. "\n")
        file:close()
    end

    -- Replace text in the current file with the link
    local link = '[' .. word .. '](' .. filename .. ')'
    local line = vim.fn.getline('.')
    local new_line = string.gsub(line, word, link)
    vim.fn.setline('.', new_line)

    -- Navigate to the created file
    vim.api.nvim_exec('e ' .. filepath, false)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(ev)
        vim.keymap.set({ "n", "v" }, "<leader>nf", create_file)
    end
})
