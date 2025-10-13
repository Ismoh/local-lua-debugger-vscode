# Changelog

## Version 0.4.0

- feat: add GitHub action for easier release creation \
    Refs: [#14](https://github.com/Ismoh/local-lua-debugger-vscode/issues/14)

## Version 0.3.9

- fix: [#25](https://github.com/Ismoh/local-lua-debugger-vscode/issues/25): Change the error wrapper to pass the original error intact ([#26](https://github.com/Ismoh/local-lua-debugger-vscode/pull/26))

## Version 0.3.8

- fix: breakpoints don't work if love2d is used with scriptRoots
    * fixes introduced bug https://github.com/Ismoh/local-lua-debugger-vscode/issues/9
    * preserving fix for https://github.com/tomblind/local-lua-debugger-vscode/issues/62
- tests: add new test case for breakpoints with relative paths
- fix: assert-level-fix applied only to compiled `lldebugger.lua`

## Version 0.3.7

- fix: handle assert() correctly\
    Fixes [tomblind#74](https://github.com/tomblind/local-lua-debugger-vscode/issues/74) by starting the trace one level deeper, skipping over `debuggerAssert` as was likely intended.

## Version 0.3.6

- Add new VSCode marketplace release/publish
- Add GitHub Actions CI/CD for automatic releases, when creating a new tag
- Add VSCode task for creating a new release
- Update publisher name to `ismoh-games`
- Update `local-lua-debugger-vscode` to `second-local-lua-debugger-vscode` to avoid conflicts with the original extension

## Version 0.3.5

- Fixed `"Failed to find extension path"`

## Version 0.3.4

- Fixed breakpoints not being hit, see original [pull request](https://github.com/tomblind/local-lua-debugger-vscode/pull/71) and forked [one](https://github.com/Ismoh/local-lua-debugger-vscode/pull/3)
- Additional fixed breakpoints not being hit, see original [pull request](https://github.com/tomblind/local-lua-debugger-vscode/pull/67) and forked [one](https://github.com/Ismoh/local-lua-debugger-vscode/pull/1)
- Added support for inspection of functions, see original [pull request](https://github.com/tomblind/local-lua-debugger-vscode/pull/72) and forked [one](https://github.com/Ismoh/local-lua-debugger-vscode/pull/2/files)
- Bumped `vscode` dependency to `^2.23.0` and `debugadapter` to `^1.64.0` to fix security vulnerabilities, see forked [pull request](https://github.com/Ismoh/local-lua-debugger-vscode/pull/4). Also necessary to fix breakpoints not being hit
- Changed `Clean` task
- Added disclaimer to `README.md` about the fork
- Changed `.gitignore` to ignore `node_modules`, but include build files to apply those on [noita-vscode-debugger](https://github.com/Ismoh/noita-vscode-debugger), which relies on this extension
- Update `package.json` for the fork

## Version 0.3.3

- Added support for utf8 identifier names
- Implemented pipe communication as an alternative to using stdio (use `"communication": "pipe"` under `"program"`)
- No longer stepping into Lua when a sourcemap exists but the line is not mapped (use stepUnmappedLines for old behavior)
- Ensuring child processes are killed on Linux
- Fixed many bugs and improved visualization of some expressions

## Version 0.3.2

- Added `ignorePatterns` option to skip over specified files when stepping (useful for busted)
- Allowed `scriptFiles` to work with leading relative paths (`./`)

## Version 0.3.1

- Removed tests from extension bundle

## Version 0.3.0

- **BREAKING CHANGE**: Breakpoints for sourcemapped files now resolved at startup. `scriptFiles` option added and is required for this functionality. See [README](README.md) for more information.
- Added `LOCAL_LUA_DEBUGGER_FILEPATH` environment variable to supply the debugger script's path to environments that cannot require it normally
- Fixed issues with paths in environments that internally use absolute paths in their local project
- Fixed ignoring explicitly disabled `breakImmediately` in `start()`
- Performance improvements

## Version 0.2.3

- Added support for breaking on implicit errors in coroutines (not supported in Lua 5.1)
- Global reference to the debugger is now stored in `lldebugger`
- Fixed handling of sourcemaps with absolute paths
- Many internal upgrades, fixes, and improvements

## Version 0.2.2

- Fixed bug when tostring metamethod has errors
- Fixed handling of backslashes in args (thanks to ousttrue)
- Fixed some issues with propagation of errors
- Calls to `error` and `assert` will now break inside of coroutines

## Version 0.2.1

- Fixed handling of control characters
- Fixed issue with handling recursive metatables

## Version 0.2.0

- Experimental support for mapping variable names from source maps
- Passing executable and script through 'arg' to fully simulate standard environment
- Using function environments instead of '_G' when evaluating expressions
- Added 'scriptRoots' option for enviornments with custom loaders
- Removed 'sourceRoot' option
- Addressed output being delayed under some circumstances
- Other small bug fixes

## Version 0.1.10

- Fixed breakpoints set on first line of code
- Fixed handling of null bytes in strings
- Preventing false error break when `debug.traceback` is called by lua scripts
- Various other small bug fixes

## Version 0.1.9

- Fixed issue with tables that have custom len operator
- Fixed passing `arg` to files being debugged

## Version 0.1.8

- Suppport for debugging threads not created by coroutine.creae/wrap (fixes torch luajit)
- Fixed infinite recursion when debugger assert fails

## Version 0.1.7

- Fixed issues with finding source maps when environment supplies only filenames
- Updated some npm packages for security vulnerabilities

## Version 0.1.6

- Fixed issues with output parsing, including hangups and incorrect newlines
- Fixed issues with paths in source maps

## Version 0.1.5

Fixed path formatting on windows when custom lua interpreter uses forward slashes

## Version 0.1.4

Fixed issues with package search paths

- Default lua paths are now correctly retained when `LUA_PATH` is not set
- Correctly handling version-specific `LUA_PATH` environment variables (`LUA_PATH_5_2`, etc...)

## Version 0.1.3

Fix for attempting to debug builtin functions in luajit

## Version 0.1.2

Fix for empty source mappings

## Version 0.1.1

Fixed installation from marketplace

## Version 0.1.0

Initial release
