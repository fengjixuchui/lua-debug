local mgr = require 'backend.master.mgr'

local response = {}

function response.error(req, msg)
    mgr.sendToClient {
        type = 'response',
        seq = mgr.newSeq(),
        command = req.command,
        request_seq = req.seq,
        success = false,
        message = msg,
    }
end

function response.success(req, body)
    mgr.sendToClient {
        type = 'response',
        seq = mgr.newSeq(),
        command = req.command,
        request_seq = req.seq,
        success = true,
        body = body,
    }
end

function response.initialize(req)
    if req.__norepl then
        mgr.newSeq()
        return
    end
    mgr.sendToClient {
        type = 'response',
        seq = mgr.newSeq(),
        command = req.command,
        request_seq = req.seq,
        success = true,
        body = require 'common.capabilities',
    }
end

function response.threads(req, threads)
    mgr.sendToClient {
        type = 'response',
        seq = mgr.newSeq(),
        command = req.command,
        request_seq = req.seq,
        success = true,
        body = {
            threads = threads
        },
    }
end

return response
