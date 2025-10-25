
local M = {}

M.setup = function()
    vim.keymap.set({'i', 'v'}, 'jk', '<ESC>', {})
    vim.keymap.set({'i', 'v'}, 'kj', '<ESC>', {})

    local vscode = {
        action = function(method, params)
            vim.fn.VSCodeNotify(method, params.args)
        end
    }

    local function notify_vscode_mode()
        local mode = vim.api.nvim_get_mode().mode
        local mode_name = ""
        -- Convert Neovim mode to readable name
        if mode == "n" then
            mode_name = "normal"
        elseif mode == "i" then
            mode_name = "insert"
        elseif mode == "v" then
            mode_name = "visual"
        elseif mode == "V" then
            mode_name = "visual"
        elseif mode == "\22" then
            mode_name = "visual"
        elseif mode == "c" then
            mode_name = "cmdline"
        elseif mode == "R" then
            mode_name = "replace"
        else
            mode_name = mode
        end
        --  Call VSCode extension to update UI asynchronously
        vscode.action("nvim-ui-plus.setMode", {
            args = { mode = mode_name }
        })
    end

    -- Mode change notification autocmd
    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*",
        callback = notify_vscode_mode,
    })
end


return M

