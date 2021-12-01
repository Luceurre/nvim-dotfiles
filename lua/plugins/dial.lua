local dial = require('dial')

dial.augends['custom#boolean'] = dial.common.enum_cyclic({
    name = 'boolean',
    strlist = { 'true', 'false' },
})

dial.augends['custom#Boolean'] = dial.common.enum_cyclic({
    name = 'Boolean',
    strlist = { 'True', 'False' },
})

dial.config.searchlist.normal = {
    'custom#boolean',
    'custom#Boolean',
}
