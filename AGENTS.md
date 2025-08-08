<general_rules>
- Always use `-compile([export_all])` or `-compile(export_all)` in all modules to enable easy testing and experimentation with functions
- Before creating new functionality, search existing modules in the root directory to see if similar functionality already exists
- Place all new modules directly in the root directory alongside existing examples - do not create subdirectories
- Use the `road.sh` script as the primary example of how to execute compiled Erlang modules from the command line
- Compile modules individually using `erlc module_name.erl` when needed for testing or execution
- Follow the existing naming conventions: use lowercase module names with underscores for separation (e.g., `tail_fac.erl`, `what_the_if.erl`)
</general_rules>

<repository_structure>
This is an Erlang learning and tutorial repository designed to demonstrate various Erlang concepts through practical examples. The repository structure is intentionally flat and simple:

- All `.erl` modules are located directly in the root directory for easy access and exploration
- `records.hrl` is the single shared header file containing record definitions used across modules
- `road.sh` is an executable script that demonstrates how to run the road pathfinding example
- `road.txt` contains input data for the road pathfinding algorithm
- `.gitignore` is configured to exclude `*.beam` files (compiled Erlang bytecode)
- The repository contains diverse example modules covering: RPN calculator (`calc.erl`), process management (`linkmon.erl`, `kitchen.erl`, `multiproc.erl`), data structures (`tree.erl`, `list.erl`), exception handling (`exceptions.erl`), higher-order functions (`hhfuns.erl`), and basic language features (`functions.erl`, `guards.erl`, `cases.erl`)
</repository_structure>

<dependencies_and_installation>
This repository uses no formal dependency management system and requires only standard Erlang/OTP libraries that come with any Erlang installation.

- No package managers (rebar3, mix, etc.) are used
- No external dependencies need to be installed
- Modules can be compiled individually using `erlc module_name.erl`
- The `road.sh` script demonstrates the typical pattern for running compiled modules: `erl -noshell -run module_name function_name arguments`
- Ensure you have Erlang/OTP installed on your system to compile and run the examples
</dependencies_and_installation>

<testing_instructions>
This repository uses a simple inline testing pattern without any formal testing framework:

- Tests are implemented as functions within the same module they test (e.g., `rpn_test()` function in `calc.erl`)
- Tests use simple assertion-based patterns with pattern matching to verify expected results
- To run tests, compile the module with `erlc module_name.erl` and then call the test function in the Erlang shell: `module_name:test_function_name().`
- Test functions typically return `ok` on success or crash with a pattern matching error on failure
- Not all modules have explicit test functions - this repository prioritizes learning and experimentation over comprehensive testing
- Use the Erlang shell (`erl`) for interactive testing and exploration of module functions
</testing_instructions>

<pull_request_formatting>
</pull_request_formatting>
