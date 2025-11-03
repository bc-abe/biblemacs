;; biblemacs-light-theme.el --- A truly minimal monochrome *light* Emacs theme

;;; Commentary:
;; A minimal light theme with sparse use of color, inspired by "On the design of text editors"

;;; Code:

(deftheme biblemacs-light
  "A minimal monochrome light theme with sparse color accents")

;; Minimal light palette - mostly grayscale with subtle accents
(let ((bg-primary "#f8f9fa")        ; Almost white background
      (bg-secondary "#f1f3f5")      ; Slightly darker for secondary blocks
      (bg-tertiary "#e9ecef")       ; For code blocks and subtle highlights
      (bg-line "#e6e8eb")           ; Current line highlight
      
      (fg-primary "#222222")        ; Near-black primary text
      (fg-secondary "#6b7280")      ; Medium gray for less important text
      (fg-tertiary "#c0c4cc")       ; Light gray for borders and faint text
      
      (accent-mint "#4e9e70")       ; Muted mint green (success)
      (accent-sage "#7a8c78")       ; Sage (for strings)
      (accent-critical "#d85b5b"))  ; Soft red (errors))

  (custom-theme-set-faces
   'biblemacs-light

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

   ;; Parentheses
   `(show-paren-match ((t (:background ,bg-primary :foreground ,fg-primary :bold t :underline t))))
   `(show-paren-mismatch ((t (:background ,bg-primary :foreground ,accent-critical :bold t))))
   
   ;; Minibuffer and search
   `(minibuffer-prompt ((t (:weight bold :foreground ,fg-primary))))
   `(isearch ((t (:background ,fg-secondary :foreground ,bg-primary :bold t))))
   `(lazy-highlight ((t (:background ,bg-tertiary :foreground ,fg-primary))))
   `(link ((t (:foreground ,fg-primary :underline t))))
   
   ;; Mode line
   `(mode-line ((t (:box (:line-width -1 :color ,fg-tertiary)
                    :background ,bg-secondary :foreground ,fg-primary))))
   `(mode-line-inactive ((t (:box (:line-width -1 :color ,fg-tertiary)
                             :background ,bg-primary :foreground ,fg-secondary))))
   
   ;; Font lock (syntax)
   `(font-lock-keyword-face ((t (:weight bold :foreground ,fg-primary))))
   `(font-lock-function-name-face ((t (:weight bold :foreground ,fg-primary))))
   `(font-lock-builtin-face ((t (:foreground ,fg-primary))))
   `(font-lock-constant-face ((t (:italic t :foreground ,fg-primary))))
   `(font-lock-type-face ((t (:foreground ,fg-primary))))
   `(font-lock-preprocessor-face ((t (:foreground ,fg-secondary))))
   `(font-lock-variable-name-face ((t (:foreground ,fg-primary))))
   `(font-lock-comment-face ((t (:foreground ,fg-secondary :italic t))))
   `(font-lock-string-face ((t (:foreground ,accent-sage))))
   `(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-warning-face ((t (:foreground ,fg-primary 
                                 :underline (:color ,accent-critical :style wave)))))
   
   ;; Line numbers
   `(line-number ((t (:foreground ,fg-tertiary))))
   `(linum ((t (:inherit line-number))))
   
   ;; Eshell
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
   
   ;; Company
   `(company-tooltip ((t (:background ,bg-secondary :foreground ,fg-primary))))
   `(company-tooltip-selection ((t (:background ,bg-tertiary :foreground ,fg-primary))))
   `(company-tooltip-common ((t (:bold t))))
   `(company-tooltip-common-selection ((t (:bold t))))
   `(company-tooltip-scrollbar-track ((t (:background ,bg-tertiary))))
   `(company-tooltip-scrollbar-thumb ((t (:background ,fg-tertiary))))
   `(company-tooltip-annotation ((t (:background ,bg-secondary :foreground ,fg-secondary :italic t))))
   `(company-tooltip-annotation-selection ((t (:background ,bg-tertiary :foreground ,fg-secondary :italic t))))
   
   ;; Git gutter
   `(git-gutter:modified ((t (:background ,fg-secondary :foreground ,fg-secondary))))
   `(git-gutter:added ((t (:background ,accent-mint :foreground ,accent-mint))))
   `(git-gutter:deleted ((t (:background ,accent-critical :foreground ,accent-critical))))
   
   ;; Diff
   `(diff-hl-change ((t (:background ,fg-secondary :foreground ,fg-secondary))))
   `(diff-hl-insert ((t (:background ,accent-mint :foreground ,accent-mint))))
   `(diff-hl-delete ((t (:background ,accent-critical :foreground ,accent-critical))))
   
   ;; Ido
   `(ido-first-match ((t (:bold t))))
   `(ido-only-match ((t (:bold t))))
   `(ido-subdir ((t (:foreground ,fg-secondary))))
   `(ido-virtual ((t (:foreground ,fg-secondary))))
   `(ido-vertical-match-face ((t (:bold t))))
   
   ;; Org mode
   `(org-level-1 ((t (:weight bold :foreground ,fg-primary ))))
   `(org-level-2 ((t (:weight bold :foreground ,fg-primary ))))
   `(org-level-3 ((t (:weight bold :foreground ,fg-primary))))
   `(org-level-4 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-5 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-6 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-7 ((t (:weight normal :foreground ,fg-primary))))
   `(org-level-8 ((t (:weight normal :foreground ,fg-primary))))
   
   `(org-table ((t (:foreground ,fg-secondary))))
   `(org-block ((t (:inherit nil :extend t :background ,bg-secondary :foreground ,fg-primary))))
   `(org-block-begin-line ((t (:inherit org-meta-line :extend t 
                               :foreground ,fg-secondary :background ,bg-primary))))
   `(org-block-end-line ((t (:extend t :foreground ,fg-secondary :background ,bg-primary))))
   `(org-target ((t (:foreground ,fg-secondary))))
   `(org-meta-line ((t (:foreground ,fg-secondary))))
   `(org-notes-block ((t (:background ,bg-secondary :extend t))))
   `(org-any-block ((t (:background ,bg-secondary :extend t))))
   `(org-ellipsis ((t (:foreground ,fg-secondary :underline nil))))
   `(org-todo ((t (:foreground ,fg-primary :weight bold))))
   `(org-done ((t (:foreground ,fg-secondary :weight normal))))
   `(org-headline-done ((t (:foreground ,fg-secondary))))
   `(org-drawer ((t (:foreground ,fg-tertiary))))
   `(org-document-title ((t (:foreground ,accent-sage))))
   `(org-date ((t (:foreground ,fg-secondary :underline t))))
   
   ;; Special highlighting
   `(hl-sentence ((t (:background ,bg-tertiary))))
   
   ;; Tab bar
   `(tab-bar ((t (:background ,bg-primary :foreground ,fg-primary))))
   `(tab-bar-tab ((t (:background ,bg-secondary :foreground ,fg-primary :bold t
                      :box (:line-width 1 :color ,fg-tertiary)))))
   `(tab-bar-tab-inactive ((t (:background ,bg-primary :foreground ,fg-secondary
                               :box (:line-width 1 :color ,fg-tertiary)))))
   `(tab-bar-tab-group-current ((t (:inherit tab-bar-tab))))
   `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
   `(tab-bar-tab-ungrouped ((t (:inherit tab-bar-tab-inactive))))))

(provide-theme 'biblemacs-light)

;;; biblemacs-light-theme.el ends here
