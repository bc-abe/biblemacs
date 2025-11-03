;; biblemacs-dark-theme.el --- A truly minimal monochrome Emacs theme

;;; Commentary:
;; A minimal theme with sparse use of color, inspired by "On the design of text editors"

;;; Code:

(deftheme biblemacs-dark
  "A minimal monochrome theme with sparse color accents")

;; Minimal color palette - mostly grayscale with subtle accents
(let ((bg-primary "#0e1011")        ; Almost pure dark gray (less blue)
      (bg-secondary "#151719")      ; Slightly lighter gray
      (bg-tertiary "#1c1e21")       ; Medium gray for subtle blocks
      (bg-line "#1a1c1f")           ; Current line highlight
      
      (fg-primary "#c5cdd9")        ; White foreground
      (fg-secondary "#6b7280")      ; Dimmed gray for less important text
      (fg-tertiary "#3e4451")       ; Very dim for borders
      
      (accent-mint "#a8d5ba")       ; Mint green (only for success states)
      (accent-sage "#8b9e8a")       ; Sage (for strings only)
      (accent-critical "#d08785"))  ; Critical red (errors only)

  (custom-theme-set-faces
   'biblemacs-dark
   
 `(default ((t (:background ,bg-primary :foreground ,fg-primary))))
   `(cursor ((t (:background ,fg-primary :box (:line-width -1 :color ,fg-primary)))))
   `(fringe ((t (:background ,bg-primary))))
   `(vertical-border ((t (:foreground ,fg-tertiary))))
   `(region ((t (:background ,bg-tertiary :foreground ,fg-primary))))
   `(hl-line ((t (:background ,bg-line))))
   `(highlight-current-line-face ((t (:inherit hl-line))))
   
   ;; Evil mode cursors
   `(evil-normal-state-cursor ((t (:background nil :box (:line-width -1 :color ,fg-primary)))))
   `(evil-insert-state-cursor ((t (:background ,accent-mint :box (:line-width -1)))))
   `(evil-visual-state-cursor ((t (:background ,fg-secondary))))
   `(evil-replace-state-cursor ((t (:background ,accent-critical))))
   `(evil-operator-state-cursor ((t (:background nil :box (:line-width -1 :color ,fg-primary)))))
   
   ;; Parentheses matching - minimal color
   `(show-paren-match ((t (:background ,bg-primary :foreground ,fg-primary :bold t :underline t))))
   `(show-paren-mismatch ((t (:background ,bg-primary :foreground ,accent-critical :bold t))))
   
   ;; Minibuffer and search - no color
   `(minibuffer-prompt ((t (:weight bold :foreground ,fg-primary))))
   `(isearch ((t (:background ,fg-secondary :foreground ,bg-primary :bold t))))
   `(lazy-highlight ((t (:background ,bg-tertiary :foreground ,fg-primary))))
   `(link ((t (:foreground ,fg-primary :underline t))))
   
   ;; Mode line - pure monochrome
   `(mode-line ((t (:box (:line-width -1 :color ,fg-tertiary) 
                    :background ,bg-secondary :foreground ,fg-primary))))
   `(mode-line-inactive ((t (:box (:line-width -1 :color ,fg-tertiary) 
                             :background ,bg-primary :foreground ,fg-secondary))))
   
   ;; Font lock - MINIMAL syntax highlighting, mostly weight-based
   `(font-lock-keyword-face ((t (:weight bold :foreground ,fg-primary))))
   `(font-lock-function-name-face ((t (:weight bold :foreground ,fg-primary))))
   `(font-lock-builtin-face ((t (:foreground ,fg-primary))))
   `(font-lock-constant-face ((t (:italic t :foreground ,fg-primary))))
   `(font-lock-type-face ((t (:foreground ,fg-primary))))
   `(font-lock-preprocessor-face ((t (:foreground ,fg-secondary))))
   `(font-lock-variable-name-face ((t (:foreground ,fg-primary))))
   `(font-lock-comment-face ((t (:foreground ,fg-secondary :italic t))))
   `(font-lock-string-face ((t (:foreground ,accent-sage))))  ; Only strings get color
   `(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-warning-face ((t (:foreground ,fg-primary 
                                 :underline (:color ,accent-critical :style wave)))))
   
   ;; Line numbers - very subtle
   `(line-number ((t (:foreground ,fg-tertiary))))
   `(linum ((t (:inherit line-number))))
   
   ;; Eshell - monochrome
   `(eshell-prompt ((t (:foreground ,fg-primary :bold t))))
   `(eshell-ls-directory ((t (:foreground ,fg-primary :bold t))))
   `(eshell-ls-archive ((t (:foreground ,fg-secondary))))
   `(eshell-ls-backup ((t (:foreground ,fg-secondary))))
   `(eshell-ls-clutter ((t (:foreground ,fg-secondary))))
   `(eshell-ls-executable ((t (:foreground ,fg-primary))))
   `(eshell-ls-missing ((t (:foreground ,accent-critical))))
   `(eshell-ls-product ((t (:foreground ,fg-secondary))))
   `(eshell-ls-readonly ((t (:foreground ,fg-secondary))))
   `(eshell-ls-special ((t (:foreground ,fg-primary))))
   `(eshell-ls-symlink ((t (:foreground ,fg-primary :italic t))))
   
   ;; Company - monochrome
   `(company-tooltip ((t (:background ,bg-secondary :foreground ,fg-primary))))
   `(company-tooltip-selection ((t (:background ,bg-tertiary :foreground ,fg-primary))))
   `(company-tooltip-common ((t (:bold t))))
   `(company-tooltip-common-selection ((t (:bold t))))
   `(company-tooltip-scrollbar-track ((t (:background ,bg-tertiary))))
   `(company-tooltip-scrollbar-thumb ((t (:background ,fg-tertiary))))
   `(company-tooltip-annotation ((t (:background ,bg-secondary :foreground ,fg-secondary :italic t))))
   `(company-tooltip-annotation-selection ((t (:background ,bg-tertiary :foreground ,fg-secondary :italic t))))
   
   ;; Git gutter - minimal color for actual changes only
   `(git-gutter:modified ((t (:background ,fg-secondary :foreground ,fg-secondary))))
   `(git-gutter:added ((t (:background ,accent-mint :foreground ,accent-mint))))
   `(git-gutter:deleted ((t (:background ,accent-critical :foreground ,accent-critical))))
   
   ;; Diff highlighting
   `(diff-hl-change ((t (:background ,fg-secondary :foreground ,fg-secondary))))
   `(diff-hl-insert ((t (:background ,accent-mint :foreground ,accent-mint))))
   `(diff-hl-delete ((t (:background ,accent-critical :foreground ,accent-critical))))
   
   ;; Ido - monochrome
   `(ido-first-match ((t (:bold t))))
   `(ido-only-match ((t (:bold t))))
   `(ido-subdir ((t (:foreground ,fg-secondary))))
   `(ido-virtual ((t (:foreground ,fg-secondary))))
   `(ido-vertical-match-face ((t (:bold t))))
   
   ;; Org mode - UNIFIED HEADING COLORS (all same whitish color)
   `(org-level-1 ((t (:weight bold :foreground ,fg-primary ))))
   `(org-level-2 ((t (:weight bold :foreground ,fg-primary ))))
   `(org-level-3 ((t (:weight bold :foreground ,fg-primary))))
   `(org-level-4 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-5 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-6 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-7 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-8 ((t (:weight normal :foreground ,fg-primary))))
   
   ;; Org blocks - subtle, no color
   `(org-table ((t (:foreground ,fg-secondary))))
   `(org-block ((t (:inherit nil :extend t :background ,bg-secondary :foreground ,fg-primary))))
   `(org-block-begin-line ((t (:inherit org-meta-line :extend t 
                               :foreground ,fg-secondary :background ,bg-primary))))
   `(org-block-end-line ((t (:extend t :foreground ,fg-secondary :background ,bg-primary))))
   `(org-target ((t (:foreground ,fg-secondary))))
   `(org-meta-line ((t (:foreground ,fg-secondary))))
   
   `(org-notes-block ((t (:background ,bg-secondary :extend t))))
   `(org-any-block ((t (:background ,bg-secondary :extend t))))
   
   ;; Org ellipsis - minimal
   `(org-ellipsis ((t (:foreground ,fg-secondary :underline nil))))
   
   ;; Org TODO states
   `(org-todo ((t (:foreground ,fg-primary :weight bold))))
   `(org-done ((t (:foreground ,fg-secondary :weight normal))))
   `(org-headline-done ((t (:foreground ,fg-secondary))))
   `(org-drawer ((t (:foreground ,fg-tertiary))))
   `(org-document-title ((t (:foreground ,accent-sage))))
   
   ;; Org dates
   `(org-date ((t (:foreground ,fg-secondary :underline t))))
   
   ;; Special highlighting - very subtle
   `(hl-sentence ((t (:background ,bg-tertiary))))
   
   ;; Tab bar - monochrome
   `(tab-bar ((t (:background ,bg-primary :foreground ,fg-primary))))
   `(tab-bar-tab ((t (:background ,bg-secondary :foreground ,fg-primary :bold t
                      :box (:line-width 1 :color ,fg-tertiary)))))
   `(tab-bar-tab-inactive ((t (:background ,bg-primary :foreground ,fg-secondary
                               :box (:line-width 1 :color ,fg-tertiary)))))
   `(tab-bar-tab-group-current ((t (:inherit tab-bar-tab))))
   `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
   `(tab-bar-tab-ungrouped ((t (:inherit tab-bar-tab-inactive))))))

(provide-theme 'biblemacs-dark)

;;; biblemacs-dark-theme.el ends here
