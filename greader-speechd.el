;;; greader-speechd.el --- speech-dispatcher back-end for greader  -*- lexical-binding: t; -*-
					;Copyright (C) 2019 by Michelangelo Rodriguez


;;; customization variables
(defgroup greader-speechd
  nil
  "speech-dispatcher back-end for greader"
  :group 'greader)

(defcustom
  greader-speechd-executable
  "spd-say"
  "executable file name."
  :tag "speech-dispatcher client executable file name"
  :type 'string)
(defcustom
  greader-speechd-executable-path
  (greader-speechd-find-executable)
  "Path of speech-dispatcher client executable."
  :tag "speechd client executable path"
  :type 'string)
(defcustom
  greader-speechd-language
  "en"
  "specifies language of speech-dispatcher client to speak in."
  :tag "speech-dispatcher language"
  :type 'string)
(defcustom
  greader-speechd-rate
  10
  "specifies rate of speech.
(From -100 to 100.)"
  :tag "speech-dispatcher rate"
  :type 'integer)
(defcustom
  greader-speechd-punctuation
  0
  "punctuation level for speech-dispatcher client.
(0 = none, 1 = some, 2 or > 2 all)"
  :tag "speech-dispatcher punctuation level"
  :type 'integer)
