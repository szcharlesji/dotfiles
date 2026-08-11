-- Native VS Code replacements for LazyVim picker-driven keymaps.
--
-- Keep this separate from the regular config: vscode-neovim uses VS Code for
-- UI, so Neovim pickers, floating windows, and lists are deliberately absent.
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

local function map(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, { desc = desc, silent = true })
end

local function action(command, args)
  return function()
    vscode.action(command, args and { args = args } or nil)
  end
end

local function find_in_files(query, is_regex)
  local args = query and { query = query } or {}
  if is_regex then
    args.isRegex = true
  end
  vscode.action("workbench.action.findInFiles", { args = args })
end

local function selection_or_word()
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" or mode == "\22" then
    return table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = mode }), "\n")
  end
  return vim.fn.expand("<cword>")
end

-- Top-level picker maps.
map("n", "<leader>,", action("workbench.action.showAllEditorsByMostRecentlyUsed"), "Buffers")
map("n", "<leader>/", action("workbench.action.findInFiles"), "Grep (Workspace)")
map("n", "<leader>:", action("workbench.action.showCommands"), "Command Palette")
map("n", "<leader><space>", action("workbench.action.quickOpen"), "Find Files")
map("n", "<leader>n", action("notifications.showList"), "Notifications")
map("n", "<leader>e", action("workbench.view.explorer"), "Explorer")
map("n", "<leader>ft", action("workbench.action.terminal.toggleTerminal"), "Terminal")
map("n", "<leader>fT", action("workbench.action.terminal.toggleTerminal"), "Terminal")
map("n", "<leader>fp", action("workbench.action.togglePanel"), "Toggle Panel")
map("n", "<leader>fa", action("workbench.action.toggleAuxiliaryBar"), "Toggle Secondary Sidebar")

-- VS Code owns editor groups, so use its focus commands instead of Neovim
-- window navigation or smart-splits/tmux integration.
map("n", "<C-h>", action("workbench.action.focusLeftGroup"), "Focus Left Editor Group")
map("n", "<C-j>", action("workbench.action.focusBelowGroup"), "Focus Below Editor Group")
map("n", "<C-k>", action("workbench.action.focusAboveGroup"), "Focus Above Editor Group")
map("n", "<C-l>", action("workbench.action.focusRightGroup"), "Focus Right Editor Group")

-- Find.
map("n", "<leader>fb", action("workbench.action.showAllEditorsByMostRecentlyUsed"), "Buffers")
map("n", "<leader>fB", action("workbench.action.showAllEditorsByMostRecentlyUsed"), "Buffers (all)")
map("n", "<leader>fc", action("workbench.action.openSettingsJson"), "Settings JSON")
map("n", "<leader>ff", action("workbench.action.quickOpen"), "Find Files")
map("n", "<leader>fF", action("workbench.action.quickOpen"), "Find Files")
map("n", "<leader>fg", action("workbench.action.quickOpen"), "Find Git File")
map("n", "<leader>fr", action("workbench.action.openRecent"), "Recent")
map("n", "<leader>fR", action("workbench.action.openRecent"), "Recent")
map("n", "<leader>fp", action("workbench.action.openRecent"), "Projects")

-- Git pickers.
map("n", "<leader>gd", action("workbench.view.scm"), "Git Diff")
map("n", "<leader>gD", action("workbench.view.scm"), "Git Diff")
map("n", "<leader>gs", action("workbench.view.scm"), "Git Status")
map("n", "<leader>gS", action("workbench.view.scm"), "Git Stash")
map("n", "<leader>gL", action("workbench.action.openTimeline"), "Git Log")
map("n", "<leader>gb", action("git.blame.toggleEditorDecoration"), "Git Blame")
map("n", "<leader>gf", action("workbench.action.openTimeline"), "Git File History")
map("n", "<leader>gl", action("workbench.action.openTimeline"), "Git Log")
map("n", "<leader>gg", action("workbench.view.scm"), "Source Control")
map("n", "<leader>gG", action("workbench.view.scm"), "Source Control")
map({ "n", "x" }, "<leader>gB", action("git.openRemote"), "Git Browse")
map({ "n", "x" }, "<leader>gY", action("git.copyRemoteUrl"), "Git Browse (copy URL)")

-- Search and inspection. VS Code scopes these searches to the workspace.
map("n", "<leader>sb", action("actions.find"), "Find in Buffer")
map("n", "<leader>sB", action("workbench.action.findInFiles"), "Find in Files")
map("n", "<leader>sg", action("workbench.action.findInFiles"), "Grep (Workspace)")
map("n", "<leader>sG", action("workbench.action.findInFiles"), "Grep (Workspace)")
map("n", "<leader>sp", action("workbench.view.extensions"), "Extensions")
map({ "n", "x" }, "<leader>sw", function()
  find_in_files(selection_or_word())
end, "Find Selection or Word")
map({ "n", "x" }, "<leader>sW", function()
  find_in_files(selection_or_word())
end, "Find Selection or Word")
map("n", '<leader>s"', action("workbench.action.quickOpen"), "Quick Open")
map("n", "<leader>s/", action("actions.find"), "Find in Buffer")
map("n", "<leader>sa", action("workbench.action.showCommands"), "Command Palette")
map("n", "<leader>sc", action("workbench.action.showCommands"), "Command Palette")
map("n", "<leader>sC", action("workbench.action.showCommands"), "Command Palette")
map("n", "<leader>sd", action("workbench.actions.view.problems"), "Problems")
map("n", "<leader>sD", action("workbench.actions.view.problems"), "Problems")
map("n", "<leader>sh", action("workbench.action.showCommands"), "Help")
map("n", "<leader>sH", action("workbench.action.selectTheme"), "Color Theme")
map("n", "<leader>si", action("workbench.action.selectIconTheme"), "File Icon Theme")
map("n", "<leader>sj", action("workbench.action.navigateBack"), "Navigate Back")
map("n", "<leader>sk", action("workbench.action.openGlobalKeybindings"), "Keyboard Shortcuts")
map("n", "<leader>sl", action("workbench.actions.view.problems"), "Problems")
map("n", "<leader>sM", action("workbench.action.showCommands"), "Command Palette")
map("n", "<leader>sm", action("workbench.action.gotoLine"), "Go to Line")
map("n", "<leader>sR", action("workbench.action.quickOpen"), "Quick Open")
map("n", "<leader>sq", action("workbench.actions.view.problems"), "Problems")
map("n", "<leader>su", action("workbench.action.openTimeline"), "Timeline")
map("n", "<leader>st", function()
  find_in_files("TODO")
end, "TODO")
map("n", "<leader>sT", function()
  find_in_files("TODO|FIX|FIXME", true)
end, "TODO / FIX / FIXME")

-- LSP pickers.
map("n", "gd", action("editor.action.revealDefinition"), "Goto Definition")
map("n", "gr", action("editor.action.goToReferences"), "References")
map("n", "gI", action("editor.action.goToImplementation"), "Goto Implementation")
map("n", "gy", action("editor.action.goToTypeDefinition"), "Goto Type Definition")
map("n", "<leader>ss", action("workbench.action.gotoSymbol"), "Document Symbols")
map("n", "<leader>sS", action("workbench.action.showAllSymbols"), "Workspace Symbols")
map("n", "gai", action("editor.showCallHierarchy"), "Call Hierarchy")
map("n", "gao", action("editor.showCallHierarchy"), "Call Hierarchy")

-- UI pickers.
map("n", "<leader>uC", action("workbench.action.selectTheme"), "Color Theme")
