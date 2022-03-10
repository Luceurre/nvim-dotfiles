local parsers = require('nvim-treesitter.parsers')

local function get_ts_node_at_cursor()
    local parser = parsers.get_parser()

    local ts_trees = parser:trees()
    local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))

    for _, tree in ipairs(ts_trees) do
        local ts_tree_root = tree:root()
        local range = { lnum - 1, col, lnum - 1, col }

        local current_ts_node = ts_tree_root:named_descendant_for_range(unpack(range))
        return current_ts_node
    end
end

local function find_ts_node_of_type(type, current_ts_node)
    if current_ts_node:type() == type then
        return current_ts_node
    end

    local parent_ts_node = current_ts_node:parent()
    if parent_ts_node then
        return find_ts_node_of_type(type, parent_ts_node)
    end

    return nil
end

local function print_ts_node_type_at_cursor()
    local ts_node_at_cursor = get_ts_node_at_cursor()
    print(ts_node_at_cursor:type())
end
local function find_and_print()
    local current_ts_node = get_ts_node_at_cursor()
    local result_ts_node = find_ts_node_of_type('todo_item1', current_ts_node)

    if result_ts_node then
        print(result_ts_node:type())
        return
    end

    print('Not found')
end

return {
    print = print_ts_node_type_at_cursor,
    find_and_print = find_and_print,
}
