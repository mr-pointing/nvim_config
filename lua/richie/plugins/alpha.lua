return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
" ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
" ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
"▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
"▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
"▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
"░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
"░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
"   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
"         ░    ░  ░    ░ ░        ░   ░         ░   ",
"                                ░                  ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }
    
    alpha.setup(dashboard.opts)

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end
        require("alpha").setup(dashboard.opts)
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local v = vim.version()
                local dev = ""
                if v.prerelease == "dev" then
                    dev = "-dev+" .. v.build
                else
                    dev = ""
                end
                local version = v.major .. "." .. v.minor .. "." .. v.patch .. dev
                local stats = require("lazy").stats()
                local plugins_count = stats.loaded .. "/" .. stats.count
                local ms = math.floor(stats.startuptime + 0.5)
                local time = vim.fn.strftime("%H:%M:%S")
                local date = vim.fn.strftime("%d.%m.%Y")
                local line1 = " " .. plugins_count .. " plugins loaded in " .. ms .. "ms"
                local line2 = "󰃭 " .. date .. "  " .. time
                local line3 = " " .. version

                local line1_width = vim.fn.strdisplaywidth(line1)
                local line2Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line2)) / 2) .. line2
                local line3Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line3)) / 2) .. line3

                dashboard.section.footer.val = {
                    line1,
                    line2Padded,
                    line3Padded,
                }

                pcall(vim.cmd.AlphaRedraw)
            end})
    vim.cmd([[autocmd Filetype alpha setlocal nofoldenable]])
  end,
}
