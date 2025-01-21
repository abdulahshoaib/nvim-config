vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set({ "n", "v" }, "<C-_>", ":message<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- remap for asp .net development
vim.keymap.set("n", "<leader>cc", ":w<CR>:!dotnet build -o bin<CR>")
vim.keymap.set("n", "<leader>cr", ":w<CR>:!dotnet run<CR>")

-- This is my personal setup for debugging and running assembly asm format files
-- using: i3wm & xdotool for echoing keyboard keys
-- compiles locally and then runs .com files on dosbox

vim.keymap.set("n", "<leader>d", function()
    if vim.bo.filetype == "asm" then
        local asm_file = vim.fn.expand("%:p")
        local asm_dir = vim.fn.expand("%:p:h")
        local output_file = vim.fn.expand("%:t:r")

        --nasm file -o output
        vim.fn.system("nasm " .. asm_file .. " -o " .. output_file .. ".com")

        if vim.v.shell_error ~= 0 then
            -- Run the NASM command and capture the output, including errors
            local result = vim.fn.systemlist("nasm " .. asm_file .. " -o " .. output_file .. ".com 2>&1")
            for _, line in ipairs(result) do
                print(line)  -- Print each line of the error message
            end
            print("Compilation Failed")
            return
        end

        print("Compilation Successful")
        local dosbox_command = table.concat({
            "dosbox",
            "-c \"mount c: " .. asm_dir .. "\"",
            "-c \"c:\"",
            "-c \"afd " .. output_file .. ".com \"",
            "-c \"exit \""
        }, " ")

        local job_id = vim.fn.jobstart(
        "xdotool key alt+4 && xdotool key alt+Return && " .. dosbox_command .. " -fullscreen", {
            on_exit = function()
                vim.fn.system("xdotool key ctrl+d && xdotool key alt+3")
            end
        })

        if job_id <= 0 then
            print("Failed to start DOSBox!")
        end
    else
        print("This command works only for .asm files!")
    end
end, { desc = "Compile, mount in DOSBox, and run AFD for .asm files" })


vim.keymap.set("n", "<leader>r", function()
    if vim.bo.filetype == "asm" then
        local asm_file = vim.fn.expand("%:p")
        local asm_dir = vim.fn.expand("%:p:h")
        local output_file = vim.fn.expand("%:t:r")

        --nasm file -o output
        vim.fn.system("nasm " .. asm_file .. " -o " .. output_file .. ".com")

        if vim.v.shell_error ~= 0 then
            -- Run the NASM command and capture the output, including errors
            local result = vim.fn.systemlist("nasm " .. asm_file .. " -o " .. output_file .. ".com 2>&1")
            for _, line in ipairs(result) do
                print(line)  -- Print each line of the error message
            end
            print("Compilation Failed")
            return
        end
        print("Compilation Successful")
        local dosbox_command = table.concat({
            "dosbox",
            "-c \"mount c: " .. asm_dir .. "\"",
            "-c \"c:\"",
            "-c \"" .. output_file .. ".com \"",
        }, " ")

        local job_id = vim.fn.jobstart(
        "xdotool key alt+4 && xdotool key alt+Return && " .. dosbox_command .. " -fullscreen", {
            on_exit = function()
                vim.fn.system("xdotool key ctrl+d && xdotool key alt+3")
            end
        })

        if job_id <= 0 then
            print("Failed to start DOSBox!")
        end
    else
        print("This command works only for .asm files!")
    end
end, { desc = "Compile, mount in DOSBox, and runs the code for .asm files" })
