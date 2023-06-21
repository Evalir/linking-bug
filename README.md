# Library linking bug

To repro, make sure that you're running forge with https://github.com/foundry-rs/foundry/pull/5164 or https://github.com/foundry-rs/foundry/pull/5194. Then, simply run `forge -vvvvv`. The test should revert when calling `Library2.callLibrary2`.

There are a few weird things here that seem to compose a weird bug:
- If the file Libraries.sol is not present, the test passes. There seems to be some conflict here in terms of files.
- If you log any of the Library addresses, no test is detected by forge. You'll have to comment the logs and recompile the files.
- If the unused function foo() from Contract that calls `Library` is removed, the test passes.
- If you call `foo()` instead of `callLibrary2()`, the test passes.