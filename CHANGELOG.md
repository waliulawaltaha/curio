# Changelog

All notable changes to Curio are documented here.

## 1.1.0 — Polish & bug-fix pass

### Fixed
- Renaming or deleting a collection used the browser's native `prompt()`/`confirm()` dialogs, which sandboxed iframes (including Claude's artifact viewer) can silently block — both actions could fail with no dialog appearing and no error. Replaced with themed in-app modals that work everywhere.
- Seeding starter collections, or creating collections during import, could silently stall (leaving bookmarks stuck without their collection) if a single write failed — now every write path is handled and falls back to "uncategorized" instead of hanging.
- Store writes (`update`, `remove`, rename/delete collection) now surface a toast on failure instead of failing silently.
- Removed a stray invalid CSS rule and a no-op ternary that always evaluated to the same value.

### Added
- "Select all" / "Deselect all" next to the result count while in multi-select mode.
- Middle-click / Ctrl-click on a bookmark now counts as an "open" too, so opened-count and Recently Opened stay accurate.
- `aria-label`s on the multi-select checkboxes for screen readers.

### Changed
- Keyboard shortcuts (`n`, `f`, `p`, `r`, `t`, `a`) no longer fire while a modal (command palette, stats, export, import, rename, delete-collection) is open, and `n` no longer resets an already-open add form.

## 1.0.0 — Initial release

- Collections, tags, search, and sort (newest/oldest/title/most-opened)
- Pinned, Favorites, Recently Opened, and Trash smart views with a 30-day undo window
- Bulk multi-select actions: tag, move, favorite, trash
- Duplicate-link detection on save
- Import/export as JSON or a standard Netscape bookmarks HTML file
- Command palette (`Cmd/Ctrl+K`) and keyboard shortcuts
- Grid/list layout, light/dark theme
- Rebranded from an earlier prototype ("Stacks") to **Curio**, packaged for Docker and self-hosting
