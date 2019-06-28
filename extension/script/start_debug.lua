local rdebug, root, path, cpath = ...

local m = {}

function m:start(addr, client)
    local bootstrap = ([=[
        package.path = %q
        package.cpath = %q
        local log = require 'common.log'
        log.file = %q
        local m = require 'backend.master'
        m(%q, %q, %q)
        local w = require 'backend.worker'
        w.openupdate()
    ]=]):format(
          root..path
        , root..cpath
        , root..'/worker.log'
        , root..'/error.log'
        , addr
        , client == true and "true" or "false"
    )
    rdebug.start(bootstrap)
end

function m:wait()
    rdebug.probe 'wait_client'
end

function m:event(name, ...)
    return rdebug.event('event_'..name, ...)
end

return m
