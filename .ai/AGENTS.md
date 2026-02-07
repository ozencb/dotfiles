- In all interactions and commit messages, be extremely concise and sacrifice grammar for the sake of concision.

## Plan Mode
- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.

## Code Quality
- Read code before modifying it - understand context and patterns first
- Make minimal changes - only modify what's necessary for the task
- Preserve existing style and conventions (formatting, naming, architecture)
- Avoid refactoring unless explicitly requested or required for the task

## Testing
- Run relevant tests before marking work complete
- If tests fail, fix the issue - don't mark tasks as done with failing tests
- When adding features, verify they work (run the code, test the endpoint, etc.)

## Decision Making
- When the path forward is obvious, proceed without asking
- When tradeoffs exist or requirements are ambiguous, ask first
- If you make an assumption, state it clearly

## Git Workflow
- Only commit when explicitly asked
- Use conventional commit messages matching the project's style
- Stage specific files by name, not `git add .` or `git add -A`

## What to Avoid
- Don't create documentation files unless requested
- Don't add comments unless the code logic is genuinely non-obvious
- Don't add "defensive" features like extra error handling or validation without reason
- Don't suggest alternative approaches unless the current approach is blocked
