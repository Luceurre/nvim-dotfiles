require('neorg').setup({
    load = {
        ['core.defaults'] = {},
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    cea = '~/notes/cea',
                    home = '~/notes/home',
                    gtd = '~/notes/gtd',
                },
            },
        },
        ['core.norg.concealer'] = {},
        ['core.gtd.base'] = {
            config = {
                workspace = 'gtd',
            },
        },
        ['core.norg.journal'] = {},
        ['core.norg.qol.toc'] = {},
        ['core.integrations.telescope'] = {},
        ['external.gtd-project-tags'] = {},
        ['calendar.dateinserter'] = {},
    },
})
