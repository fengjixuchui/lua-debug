return {
    supportsConfigurationDoneRequest = true,
    supportsFunctionBreakpoints = true,
    supportsConditionalBreakpoints = true,
    supportsHitConditionalBreakpoints = true,
    supportsEvaluateForHovers = true,
    supportsSetVariable = true,
    supportsRestartFrame = true,
    supportsRestartRequest = true,
    supportsExceptionInfoRequest = true,
    supportsDelayedStackTraceLoading = true,
    supportsLoadedSourcesRequest = true,
    supportsLogPoints = true,
    supportsTerminateRequest = true,
    supportsClipboardContext = true,
    supportsExceptionFilterOptions = true,
    exceptionBreakpointFilters = {
        {
            default = false,
            filter = 'lua',
            label = 'Caught Errors By Lua',
            supportsCondition = true,
            description = 'Breaks on errors, if it is caught by lua.',
            conditionDescription = 'error:match "attempt to index a nil value"',
        },
        {
            default = true,
            filter = 'native',
            label = 'Caught Errors By Native',
            supportsCondition = true,
            description = 'Breaks on errors, if it is caught by native code.',
            conditionDescription = 'error:match "attempt to index a nil value"',
        },
        {
            default = true,
            filter = 'panic',
            label = 'Uncaught Errors',
            supportsCondition = true,
            description = 'Breaks only on errors that are nor handled.',
            conditionDescription = 'error:match "attempt to index a nil value"',
        }
    }
}
