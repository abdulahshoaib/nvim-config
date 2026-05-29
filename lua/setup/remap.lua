vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

-- This is my personal setup for debugging and running assembly asm format files
-- using: i3wm & xdotool for echoing keyboard keys
-- compiles locally and then runs .com files on dosbox

local function print_command_result(result)
	if result.stdout and result.stdout ~= "" then
		print(vim.trim(result.stdout))
	end
	if result.stderr and result.stderr ~= "" then
		print(vim.trim(result.stderr))
	end
end

local function run_xdotool(...)
	vim.system({ "xdotool", "key", ... }, { text = true })
end

local function run_dosbox(args, on_exit)
	local job_id = vim.fn.jobstart(args, {
		on_exit = on_exit,
	})

	if job_id <= 0 then
		print("Failed to start DOSBox!")
	end
end

vim.keymap.set("n", "<leader>d", function()
	if vim.bo.filetype ~= "asm" then
		print("This command works only for .asm files!")
		return
	end

	local asm_file = vim.fn.expand("%:p")
	local asm_dir = vim.fn.expand("%:p:h")
	local output_name = vim.fn.expand("%:t:r") .. ".com"
	local output_path = vim.fs.joinpath(asm_dir, output_name)
	local result = vim.system({ "nasm", asm_file, "-o", output_path }, { text = true }):wait()

	if result.code ~= 0 then
		print_command_result(result)
		print("Compilation Failed")
		return
	end

	print("Compilation Successful")
	run_xdotool("alt+4")
	run_xdotool("alt+Return")
	run_dosbox({
		"dosbox",
		"-c",
		"mount c: " .. asm_dir,
		"-c",
		"c:",
		"-c",
		"afd " .. output_name,
		"-c",
		"exit",
		"-fullscreen",
	}, function()
		run_xdotool("ctrl+d")
		run_xdotool("alt+3")
	end)
end, { desc = "Compile, mount in DOSBox, and run AFD for .asm files" })

vim.keymap.set("n", "<leader>r", function()
	local filetype = vim.bo.filetype

	if filetype == "c" then
		local source_path = vim.fn.expand("%:p")
		local output_path = vim.fn.expand("%:p:r")
		local result = vim.system({ "gcc", source_path, "-o", output_path }, { text = true }):wait()

		if result.code ~= 0 then
			print_command_result(result)
			print("Compilation Failed")
			return
		end

		vim.cmd("!" .. vim.fn.shellescape(output_path))
	elseif filetype == "asm" then
		local asm_file = vim.fn.expand("%:p")
		local asm_dir = vim.fn.expand("%:p:h")
		local output_name = vim.fn.expand("%:t:r") .. ".com"
		local output_path = vim.fs.joinpath(asm_dir, output_name)
		local result = vim.system({ "nasm", asm_file, "-o", output_path }, { text = true }):wait()

		if result.code ~= 0 then
			print_command_result(result)
			print("Compilation Failed")
			return
		end

		print("Compilation Successful")
		run_xdotool("alt+4")
		run_xdotool("alt+Return")
		run_dosbox({
			"dosbox",
			"-c",
			"mount c: " .. asm_dir,
			"-c",
			"c:",
			"-c",
			output_name,
			"-fullscreen",
		}, function()
			run_xdotool("ctrl+d")
			run_xdotool("alt+3")
		end)
	else
		print("This command works only for .c and .asm files!")
	end
end, { desc = "Compile and run C/ASM files" })
