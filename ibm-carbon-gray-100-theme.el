(require 'doom-themes)

;;
;;; Variables

(defgroup ibm-carbon-gray-100-theme nil
  "Options for the `ibm-carbon-gray-100' theme."
  :group 'doom-themes)

(defcustom ibm-carbon-gray-100-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'ibm-carbon-gray-100-theme
  :type 'boolean)

(defcustom ibm-carbon-gray-100-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'ibm-carbon-gray-100-theme
  :type 'boolean)

(defcustom ibm-carbon-gray-100-comment-bg ibm-carbon-gray-100-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'ibm-carbon-gray-100-theme
  :type 'boolean)

(defcustom ibm-carbon-gray-100-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'ibm-carbon-gray-100-theme
  :type '(choice integer boolean))

(defcustom ibm-carbon-gray-100-warm nil
  "If non-nil uses the warm-gray instead of the gray line in the colors reference"
  :group 'ibm-carbon-gray-100-theme
  :type 'boolean)

;;
;;; Theme definition

(def-doom-theme ibm-carbon-gray-100
  "A theme for people who like the balance between man and machine."

  ;; name        default   256       16
  ((bg          '("#161616" nil       nil            )) ;;gray 100
   (bg-alt      '("#262626" nil       nil            )) ;;gray 90
   (base0       '("#f4f4f4" "#f4f4f4" "white"        )) ;;gray 10
   (base1       '("#e0e0e0" "#e0e0e0" "brightblack"  )) ;;gray 20
   (base2       '("#c6c6c6" "#c6c6c6" "brightblack"  )) ;;gray 30
   (base3       '("#a8a8a8" "#a8a8a8" "brightblack"  )) ;;gray 40
   (base4       '("#8d8d8d" "#8d8d8d" "brightblack"  )) ;;gray 50
   (base5       '("#6f6f6f" "#6f6f6f" "brightblack"  )) ;;gray 60
   (base6       '("#525252" "#525252" "brightblack"  )) ;;gray 70
   (base7       '("#393939" "#393939" "brightblack"  )) ;;gray 80
   (base8       '("#262626" "#262626" "black"        )) ;;gray 90
   (fg-alt      '("#ffffff" "#ffffff" "brightwhite"  ))
   (fg          '("#ffffff" "#ffffff" "white"        ))

   (grey        base3)
   (red         '("#da1e28" "#da1e28" "red"          )) ;;red 60
   (orange      '("#ff832b" "#ff832b" "brightred"    )) ;;orange 40
   (green       '("#198038" "#198038" "green"        )) ;;green 60
   (teal        '("#009d9a" "#009d9a" "brightgreen"  )) ;;teal 50
   (yellow      '("#f1c21b" "#f1c21b" "yellow"       )) ;;yellow 30
   (blue        '("#4589ff" "#4589ff" "brightblue"   )) ;;blue 50
   (dark-blue   '("#002d9c" "#002d9c" "blue"         )) ;;blue 80
   (magenta     '("#d02670" "#d02670" "magenta"      )) ;;magenta 60
   (violet      '("#8a3ffc" "#8a3ffc" "brightmagenta")) ;;purple 60
   (cyan        '("#0072c3" "#0072c3" "brightcyan"   )) ;;cyan 60
   (dark-cyan   '("#003a6d" "#003a6d" "cyan"         )) ;;cyan 80
   ; Additional custom colors
   (bright-green'("#24a148" "#24a148" "green"        )) ;;green 50 
   (brown       '("#b28600" "#b28600" "yellow"       )) ;;yellow 50
   (bright-blue '("#78a9ff" "#78a9ff" "brightblue"   )) ;;blue 

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if ibm-carbon-gray-100-brighter-comments dark-cyan grey))
   (doc-comments   (doom-lighten (if ibm-carbon-gray-100-brighter-comments dark-cyan grey) 0.25))
   (constants      magenta)
   (functions      teal)
   (keywords       blue)
   (methods        cyan)
   (operators      magenta)
   (type           yellow)
   (strings        bright-blue)
   (variables      blue)
   (numbers        magenta)
   (region         base8)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright ibm-carbon-gray-100-brighter-modeline)
   (-modeline-pad
    (when ibm-carbon-gray-100-padded-modeline
      (if (integerp ibm-carbon-gray-100-padded-modeline) ibm-carbon-gray-100-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base7
        base8))
   (modeline-bg-l modeline-bg)
   (modeline-bg-inactive   `(,(car bg) ,@(cdr base5)))
   (modeline-bg-inactive-l (doom-darken bg 0.1)))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if ibm-carbon-gray-100-comment-bg (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   ;;;; company
   (company-tooltip-selection     :background base3)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; magit
   (magit-diff-hunk-heading-highlight :foreground fg :background base4 :weight 'bold)
   (magit-diff-hunk-heading :foreground fg-alt :background base3 :weight 'normal)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))
   ;;;; org <built-in>
   ((org-block &override) :background base8)
   ((org-block-begin-line &override) :background base8)
   (org-hide :foreground hidden)
   ;;;; ivy
   (ivy-minibuffer-match-face-2 :foreground blue :weight 'bold)
   ;;;; js2-mode
   (js2-object-property :foreground dark-blue)
   (js2-object-property-access :foreground dark-cyan)
   ;;;; rjsx-mode
   (rjsx-tag :foreground dark-cyan)
   (rjsx-attr :foreground cyan :slant 'italic :weight 'medium)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l))))

  ;;;; Base theme variable overrides-
  ()
  )

;;; ibm-carbon-gray-100-theme.el ends here
