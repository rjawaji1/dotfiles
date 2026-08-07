;; inherits: markdown
((fenced_code_block
  (info_string
    (language) @language (#eq? @language "mermaid"))
  (code_fence_content) @injection.content))

