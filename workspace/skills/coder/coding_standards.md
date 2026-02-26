# Coding Standards

## General

- Write self-documenting code; comments explain "why", not "what"
- Functions do one thing
- No magic numbers; use named constants
- Handle errors explicitly

## Git

- Commit messages: `type: short description` (feat, fix, refactor, docs, ci, test)
- One logical change per commit
- Never commit secrets or credentials

## Testing

- Unit tests for business logic
- Integration tests for API boundaries
- Test names describe behavior, not implementation

## Security

- Validate all external input
- Use environment variables for secrets
- Keep dependencies updated
