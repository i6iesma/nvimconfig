-- ~/.config/nvim/lua/Inigo/plugins-setup.lua

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- Existing plugins
    use("christoomey/vim-tmux-navigator")
    use("bluz71/vim-nightfly-guicolors")
    use("Mofiqul/dracula.nvim")
    use("szw/vim-maximizer")
    use("nvim-lua/plenary.nvim")
    use("vim-scripts/ReplaceWithRegister")
    use("tpope/vim-surround")

    -- LSP plugins (keep Mason and lspconfig if you want)
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")

    -- Replace all nvim-cmp stuff with coc.nvim
    use({ "neoclide/coc.nvim", branch = "release" })

    -- Other plugins
    use("glepnir/lspsaga.nvim")
    use("onsails/lspkind.nvim")
    -- Replaced null-ls.nvim with its community successor none-ls.nvim
    use("nvimtools/none-ls.nvim")
    -- Removed mason-null-ls.nvim as it's specific to null-ls
    -- use("jayp0521/mason-null-ls.nvim")

    use("numToStr/Comment.nvim")
    use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
    use({ "ziontee113/color-picker.nvim" })
    use("norcalli/nvim-colorizer.lua")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use("windwp/nvim-autopairs")
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
    use("lewis6991/gitsigns.nvim")

    -- packer_bootstrap is handled in init.lua
end)

