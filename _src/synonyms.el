<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: synonyms.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=synonyms.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: synonyms.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=synonyms.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for synonyms.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=synonyms.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22synonyms.el%22">synonyms.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/synonyms.el">Download</a></p><pre class="code"><span class="linecomment">;;; synonyms.el --- Look up synonyms for a word or phrase in a thesaurus.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: synonyms.el</span>
<span class="linecomment">;; Description: Look up synonyms for a word or phrase in a thesaurus.</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2005-2012, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Tue Dec 20 14:39:26 2005</span>
<span class="linecomment">;; Version: 1.0</span>
<span class="linecomment">;; Last-Updated: Fri Mar  2 08:53:54 2012 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 2500</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/synonyms.el</span>
<span class="linecomment">;; Keywords: text, dictionary, thesaurus, spelling, apropos, help</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `thingatpt', `thingatpt+'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Look up synonyms for a word or phrase in a thesaurus.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Getting Started</span>
<span class="linecomment">;;  ---------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  To use library Synonyms, you will need the Moby Thesaurus II file,</span>
<span class="linecomment">;;  `mthesaur.txt', available here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    ftp://ibiblio.org/pub/docs/books/gutenberg/etext02/mthes10.zip</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Put this in your initialization file (~/.emacs):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    ;; The file names are absolute, not relative, locations</span>
<span class="linecomment">;;    ;;     - e.g. /foobar/mthesaur.txt.cache, not mthesaur.txt.cache</span>
<span class="linecomment">;;    (setq synonyms-file        &lt;name & location of mthesaur.txt&gt;)</span>
<span class="linecomment">;;    (setq synonyms-cache-file  &lt;name & location of your cache file&gt;)</span>
<span class="linecomment">;;    (require 'synonyms)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  As an alternative to the first two lines, you can use Customize to</span>
<span class="linecomment">;;  set `synonyms-file' and `synonyms-cache-file' persistently.  The</span>
<span class="linecomment">;;  second of these files is created by this library, to serve as a</span>
<span class="linecomment">;;  synonym cache for completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The main command is `synonyms'.  It prompts you for a word or</span>
<span class="linecomment">;;  phrase to look up in the thesaurus.  The synonyms found are then</span>
<span class="linecomment">;;  displayed in buffer *Synonyms*.  For example, `M-x synonyms RET</span>
<span class="linecomment">;;  democracy' displays synonyms for `democracy'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you do not define `synonyms-file' and `synonyms-cache-file'</span>
<span class="linecomment">;;  prior to using command `synonyms', that command will prompt you to</span>
<span class="linecomment">;;  define them.  If you want to use the same values during subsequent</span>
<span class="linecomment">;;  Emacs sessions, then you should use `M-x customize-option' to save</span>
<span class="linecomment">;;  those newly defined values.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Some Definitions</span>
<span class="linecomment">;;  ----------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The thesaurus is divided into "entries", which are like glossary</span>
<span class="linecomment">;;  entries: each entry is followed by associated words and phrases,</span>
<span class="linecomment">;;  which, for lack of a better word, I refer to as "synonyms".  For</span>
<span class="linecomment">;;  example, `democracy' is an entry, and it is followed by its</span>
<span class="linecomment">;;  synonyms.  Some synonyms are not also entries.  For example,</span>
<span class="linecomment">;;  `patriarchy' is in the thesaurus as a synonym but not as an entry.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Note: What I call "synonyms" here are not necessarily synonyms, in</span>
<span class="linecomment">;;  the sense of having the same or even similar meanings.  They are</span>
<span class="linecomment">;;  simply terms collected together with the same thesaurus entry</span>
<span class="linecomment">;;  because they are related in some way - the grouping is what</span>
<span class="linecomment">;;  defines their relation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  In Moby Thesaurus II, the meanings of synonyms in the same group</span>
<span class="linecomment">;;  do have something in common, but this might be simply the fact</span>
<span class="linecomment">;;  that they are terms of a similar kind.  For example, the</span>
<span class="linecomment">;;  "synonyms" following the `democracy' thesaurus entry are words</span>
<span class="linecomment">;;  such as `dictatorship' and `autocracy'.  These are different forms</span>
<span class="linecomment">;;  of the same general thing: government - they are certainly not</span>
<span class="linecomment">;;  synonymous with each other or with the entry `democracy'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Searching the Thesaurus</span>
<span class="linecomment">;;  -----------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The default input value for command `synonyms' is the word under</span>
<span class="linecomment">;;  the cursor. Alternatively, if a region is active and you are in</span>
<span class="linecomment">;;  Transient Mark mode (recommended), then it is the text in the</span>
<span class="linecomment">;;  region (selection).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Your input is actually treated as a regular expression (regexp),</span>
<span class="linecomment">;;  so you can also input patterns like `for.*ion', which will match</span>
<span class="linecomment">;;  thesaurus entries `formation', `formulation', `fornication',</span>
<span class="linecomment">;;  `fortification', and `forward motion'.  Note that the last of</span>
<span class="linecomment">;;  these is a phrase rather than a single word.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Using a regexp as input is a powerful way to search, but be aware</span>
<span class="linecomment">;;  that it can be costly in CPU time and computer memory if the</span>
<span class="linecomment">;;  regexp is not appropriate.  The regexp `.*' will, for example,</span>
<span class="linecomment">;;  likely use up available memory before being able to return the</span>
<span class="linecomment">;;  entire thesaurus (it's very large).  You can always use `C-g' to</span>
<span class="linecomment">;;  interrupt a thesaurus search if you mistakenly use an inefficient</span>
<span class="linecomment">;;  regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Using a Prefix Argument To Do More</span>
<span class="linecomment">;;  ----------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can use a prefix argument to modify searching and the</span>
<span class="linecomment">;;  presentation of search results, as follows:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `C-u'     - Search for additional synonyms, in two senses:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;                1) Return also synonyms that are matched partially</span>
<span class="linecomment">;;                   by the input.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;                2) Search the entire thesaurus for input matches,</span>
<span class="linecomment">;;                   even if the input matches a thesaurus entry.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `M--'     - Append the search results to any previous search</span>
<span class="linecomment">;;                results, in buffer *Synonyms*.  (Normally, the new</span>
<span class="linecomment">;;                results replace any previous results.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `C-u C-u' - `C-u' plus `M--': Search more and append results.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you find yourself often using a particular prefix argument (for</span>
<span class="linecomment">;;  example, to append results), then you might want to instead change</span>
<span class="linecomment">;;  the default behavior to reflect this preference.  Options</span>
<span class="linecomment">;;  `synonyms-match-more-flag' and `synonyms-append-result-flag'</span>
<span class="linecomment">;;  correspond to using `C-u' and `M--', respectively.  In fact, a</span>
<span class="linecomment">;;  prefix argument simply toggles the value of the corresponding</span>
<span class="linecomment">;;  option for the duration of the command.  So, for example, if</span>
<span class="linecomment">;;  `synonyms-append-result-flag' is t and you use `M--', then results</span>
<span class="linecomment">;;  will not be appended.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  When partially matching input (`C-u', sense #1), complete synonyms</span>
<span class="linecomment">;;  are matched against your input.  This means that you generally</span>
<span class="linecomment">;;  need not add a preceding or trailing `.*' to try to match a</span>
<span class="linecomment">;;  complete synonym.  For example, input `format' will match the</span>
<span class="linecomment">;;  complete synonyms `conformation', `efformation', `format',</span>
<span class="linecomment">;;  `formation', `formative', `formational', `information',</span>
<span class="linecomment">;;  `informative', `informational', `malformation', `deformation',</span>
<span class="linecomment">;;  `reformation', `transformation', `reformatory', and so on - there</span>
<span class="linecomment">;;  is no need to input `.*format.*' to match the same synonyms.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  To better understand the meaning of #2 above for `C-u' (to</span>
<span class="linecomment">;;  continue the search even if your input matches an entry), try, for</span>
<span class="linecomment">;;  example, `C-u M-x synonyms RET widespread'.  You'll see not only</span>
<span class="linecomment">;;  the main synonyms listed for `widespread' as an entry, but also</span>
<span class="linecomment">;;  lots of different meanings of `widespread', judging by the entries</span>
<span class="linecomment">;;  for which it is listed as a synonym:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `accepted', `ample', `broad', `broadcast', `capacious',</span>
<span class="linecomment">;;    `catholic', `commodious', `commonness', `conventional',</span>
<span class="linecomment">;;    `currency', `current', `customary', `deep', `deltoid',</span>
<span class="linecomment">;;    `diffuse', `discrete', `dispersed', `disseminated',</span>
<span class="linecomment">;;    `dissipated', `distributed', `epidemic', `established',</span>
<span class="linecomment">;;    `everyday', `expansive', `extended', `extensive', `familiar',</span>
<span class="linecomment">;;    `fan shaped', `far flung', `far reaching', `flaring', `full',</span>
<span class="linecomment">;;    `general', `indiscriminate', `infinite', `large scale',</span>
<span class="linecomment">;;    `liberal', `normal', `normality', `open', `ordinary',</span>
<span class="linecomment">;;    `outstretched', `pervasive', `popular', `prescribed',</span>
<span class="linecomment">;;    `prescriptive', `prevailing', `prevalence', `prevalent',</span>
<span class="linecomment">;;    `public', `rampant', `received', `regnant', `regular',</span>
<span class="linecomment">;;    `regulation', `reign', `rife', `roomy', `ruling', `run',</span>
<span class="linecomment">;;    `scattered', `set', spacious`', `sparse', `splay', `sporadic',</span>
<span class="linecomment">;;    `sprawling', `spread', `standard', `stock', `straggling',</span>
<span class="linecomment">;;    `stretched out', `sweeping', `time-honored', `traditional',</span>
<span class="linecomment">;;    `universal', `usual', `vast', `voluminous', `wholesale', `wide</span>
<span class="linecomment">;;    open', `wide', and `wonted'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  These are just the entries! Each of these is of course followed by</span>
<span class="linecomment">;;  its own synonyms - perhaps 100 or 300, including `widespread'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This list of entries is not the same list as the synonyms for</span>
<span class="linecomment">;;  entry `widespread'.  There are words and phrases here that are not</span>
<span class="linecomment">;;  in the latter list, and vice versa.  For example, the former (but</span>
<span class="linecomment">;;  not the latter) list includes `full'; the latter (but not the</span>
<span class="linecomment">;;  former) list includes `wide-reaching'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The latter are the words most closely related to `widespread'.</span>
<span class="linecomment">;;  The list above are the other thesaurus entries (corresponding to</span>
<span class="linecomment">;;  main categories) to which `widespread' is most closely related.</span>
<span class="linecomment">;;  Looking at all of the synonym groups in which `widespread' appears</span>
<span class="linecomment">;;  can tell you additional information about its meanings - and it</span>
<span class="linecomment">;;  can provide additional synonyms for `widespread'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Using Completion with Synonyms</span>
<span class="linecomment">;;  ------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can complete words and phrases in the minibuffer, as input to</span>
<span class="linecomment">;;  command `synonyms'.  You can use library Synonyms together with</span>
<span class="linecomment">;;  library Icicles to complete a partial word in a text buffer into a</span>
<span class="linecomment">;;  word or phrase in the thesaurus.  If you use both libraries then</span>
<span class="linecomment">;;  load Icicles after Synonyms.  For more information on Icicles, see</span>
<span class="linecomment">;;  `http://www.emacswiki.org/cgi-bin/wiki/icicles.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ** Minibuffer Input Completion **</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can enter any text to match against thesaurus synonyms.  When</span>
<span class="linecomment">;;  you are prompted by command `synonyms' to enter this text, you can</span>
<span class="linecomment">;;  also use input completion to complete to a thesaurus synonym.</span>
<span class="linecomment">;;  That is, even though you can enter any text (including a regexp),</span>
<span class="linecomment">;;  completion will only complete to synonyms in the thesaurus.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you load library Icicles, then a more powerful version of</span>
<span class="linecomment">;;  command `synonyms' is used.  In particular, it lets you:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - Use `S-TAB' during completion to see the list of all synonyms</span>
<span class="linecomment">;;     (thesaurus terms) that match your minibuffer input so far.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - Use `[next]', and `[prior]' (usually keys `Page Down' and `Page</span>
<span class="linecomment">;;     Up') during completion to cycle through the completion</span>
<span class="linecomment">;;     candidates (synonyms) that match your input.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - Use `C-o', `C-[next]', and `[C-prior]' during completion to</span>
<span class="linecomment">;;     display the synonyms of the current completion candidate.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ** Completing Buffer Text Using the Thesaurus **</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Icicles also provides two commands for using completion to insert</span>
<span class="linecomment">;;  thesaurus entries in a buffer:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - `icicle-complete-thesaurus-entry' completes a word in a text</span>
<span class="linecomment">;;     buffer to any word or phrase in the thesaurus.  I bind it to</span>
<span class="linecomment">;;     `C-c /'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - `icicle-insert-thesaurus-entry' inserts thesaurus words and</span>
<span class="linecomment">;;     phrases in a text buffer.  It is a multi-command, which means</span>
<span class="linecomment">;;     that, within a single call to it, you can insert any number of</span>
<span class="linecomment">;;     thesaurus entries, in succession.  If you want to, you can</span>
<span class="linecomment">;;     write an entire book using a single call to</span>
<span class="linecomment">;;     `icicle-insert-thesaurus-entry'!</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Browsing the Thesaurus</span>
<span class="linecomment">;;  ----------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Besides using command `synonyms' to search for synonyms, you can</span>
<span class="linecomment">;;  use Synonyms to browse the thesaurus.  This is really just the</span>
<span class="linecomment">;;  same thing, but key and mouse bindings are provided in buffer</span>
<span class="linecomment">;;  *Synonyms*, so you need not input anything - just point and click</span>
<span class="linecomment">;;  the hyperlinks.  Buffer *Synonyms* is in Synonyms major mode,</span>
<span class="linecomment">;;  which provides a few additional features.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can still choose to search for additional synonyms or append</span>
<span class="linecomment">;;  search results, without bothering with a prefix argument, by using</span>
<span class="linecomment">;;  modifier keys (Control, Meta) with a mouse click.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Another way of browsing is to revisit previous search-result</span>
<span class="linecomment">;;  pages.  You can do this using commands `synonyms-history-backward'</span>
<span class="linecomment">;;  and `synonyms-history-forward'.  In buffer *Synonyms*, these are</span>
<span class="linecomment">;;  bound to the following key sequences, for convenience:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `l', `p', `mouse-4' - `synonyms-history-backward'</span>
<span class="linecomment">;;    `r', `n', `mouse-5' - `synonyms-history-forward'</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The `l' and `r' bindings correspond to the history bindings in</span>
<span class="linecomment">;;  Info.  The `p' and `n' bindings stand for "previous" and "next".</span>
<span class="linecomment">;;  The bindings to additional mouse buttons correspond to typical</span>
<span class="linecomment">;;  bindings for Back and Forward in Web browsers.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  In addition to these bindings, the same history commands can be</span>
<span class="linecomment">;;  accessed by clicking links [Back] and [Forward] with `mouse-2'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you have previously used the append option (via, for example,</span>
<span class="linecomment">;;  `M-mouse2'), so that there are multiple search results in buffer</span>
<span class="linecomment">;;  *Synonyms*, then using a history command simply takes you to the</span>
<span class="linecomment">;;  preceding (for [Back]) or following (for [Forward]) result in the</span>
<span class="linecomment">;;  buffer, measured from the current cursor position.  Depending on</span>
<span class="linecomment">;;  the cursor position, this might be different from the previous or</span>
<span class="linecomment">;;  next search made previously.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is for convenience, but it is also more efficient in the case</span>
<span class="linecomment">;;  of a regexp search that takes a long time.  Except for this</span>
<span class="linecomment">;;  special treatment of appended results, whenever you navigate the</span>
<span class="linecomment">;;  search-results history you are actually searching again for a</span>
<span class="linecomment">;;  synonym you sought previously.  The case of appended results is</span>
<span class="linecomment">;;  analogous to accessing a Web browser cache when navigating the</span>
<span class="linecomment">;;  history.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can of course use modifier keys (Control, Meta) while you</span>
<span class="linecomment">;;  click links [Back] and [Forward], to impose their usual behavior:</span>
<span class="linecomment">;;  search for additional synonyms or append search results, or both.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Finally, some people prefer menus, so there is a Synonyms menu-bar</span>
<span class="linecomment">;;  menu when you are in Synonyms mode, complete with all of the</span>
<span class="linecomment">;;  functionalities described above.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For more information on the browsing possibilities in buffer</span>
<span class="linecomment">;;  *Synonyms*, use `?' in Synonyms mode.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Dictionary Definitions, Antonyms, etc.</span>
<span class="linecomment">;;  --------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Synonyms works with a large but simple database of groups of words</span>
<span class="linecomment">;;  and phrases that are synonyms of each other.  This database does</span>
<span class="linecomment">;;  not provide definitions of words or phrases; it simply groups</span>
<span class="linecomment">;;  them.  Command `synonym-definition' (aka `dictionary-definition')</span>
<span class="linecomment">;;  lets you look up a word or phrase (or a regexp) using one or more</span>
<span class="linecomment">;;  dictionaries on the Web.  That is usually the best source for this</span>
<span class="linecomment">;;  kind of information, but you obviously need an Internet connection</span>
<span class="linecomment">;;  to use this command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Options (variables) `synonyms-dictionary-url' and</span>
<span class="linecomment">;;  `synonyms-dictionary-alternate-url' are URLs you can set to point</span>
<span class="linecomment">;;  to the dictionaries of your choice.  The default value of</span>
<span class="linecomment">;;  `synonyms-dictionary-alternate-url' looks up the search term in</span>
<span class="linecomment">;;  multiple dictionaries, and it lets you use wildcards.  Use `C-h v</span>
<span class="linecomment">;;  synonyms-dictionary-alternate-url' for more information.  The</span>
<span class="linecomment">;;  default value of `synonyms-dictionary-url' usually provides a</span>
<span class="linecomment">;;  quicker answer.  Both of these URLs also give you access to</span>
<span class="linecomment">;;  additional information about the search term (antonyms, etymology,</span>
<span class="linecomment">;;  even pronunciation).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  In buffer *Synonyms*, you can simply hit `d' followed by `RET' or</span>
<span class="linecomment">;;  `mouse-2' to look up a term that is in the buffer.  Just as for</span>
<span class="linecomment">;;  looking up a synonym by clicking `mouse-2', if you select text</span>
<span class="linecomment">;;  (region), then that text is looked up.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  A Cache File of Synonyms</span>
<span class="linecomment">;;  ------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The very first time you use Synonyms, a large list of synonyms</span>
<span class="linecomment">;;  will be compiled and written to a cache file.  This is slow - it</span>
<span class="linecomment">;;  takes 2-3 minutes - but it is only a one-time cost.  From then on,</span>
<span class="linecomment">;;  whenever you first use Synonyms during an Emacs session, the cache</span>
<span class="linecomment">;;  file will be read (quickly), to create the list of synonyms that</span>
<span class="linecomment">;;  are used for minibuffer completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Using Other Thesauri, Dictionaries, and so on - CSV data</span>
<span class="linecomment">;;  --------------------------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  There is nothing in library Synonyms that ties it to the Moby</span>
<span class="linecomment">;;  Thesaurus II thesaurus.  All of its functionality will work with</span>
<span class="linecomment">;;  any file of comma-separated values.  Each line of such a file is</span>
<span class="linecomment">;;  interpreted as a synonym group, as understood here, and the first</span>
<span class="linecomment">;;  word or phrase on each line is interpreted as a thesaurus entry,</span>
<span class="linecomment">;;  as understood here.  This means only that search results are</span>
<span class="linecomment">;;  organized into sections with entry headers.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If, for example, you had a CSV file of personal contacts, where</span>
<span class="linecomment">;;  the first term in each line was a last name or a company name,</span>
<span class="linecomment">;;  then you could use library Synonyms to query it, producing the</span>
<span class="linecomment">;;  same kind of output as for the thesaurus.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  One thing to keep in mind if you try to use library Synonyms with</span>
<span class="linecomment">;;  a different CSV file is that there are several different CSV-file</span>
<span class="linecomment">;;  syntaxes.  The one that Synonyms is built to use is a simple one,</span>
<span class="linecomment">;;  with no quote marks around entries and no embedded quote marks</span>
<span class="linecomment">;;  within entries.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Similarly, there is nothing here that limits the functionality to</span>
<span class="linecomment">;;  English.  If you had a thesaurus in another language, it should</span>
<span class="linecomment">;;  work as well.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Currently, Synonyms works with a single raw synonyms file</span>
<span class="linecomment">;;  (thesaurus) and a corresponding single cache file (for</span>
<span class="linecomment">;;  completion).  However, it would be easy to extend the</span>
<span class="linecomment">;;  functionality to use multiple thesauri or, in general, multiple</span>
<span class="linecomment">;;  CSV files.  Suggestions of requirements (e.g. ways to select a</span>
<span class="linecomment">;;  thesaurus for particular passages of text) are welcome.</span>
 
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Things Defined Here</span>
<span class="linecomment">;;  -------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Faces defined here -</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `synonyms-heading', `synonyms-search-text',</span>
<span class="linecomment">;;    `synonyms-mouse-face'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User options (variables) defined here -</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `synonyms-append-result-flag', `synonyms-cache-file',</span>
<span class="linecomment">;;    `synonyms-file', `synonyms-fill-column',</span>
<span class="linecomment">;;    `synonyms-match-more-flag', `synonyms-mode-hook',</span>
<span class="linecomment">;;    `synonyms-use-cygwin-flag'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here -</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `dictionary-definition', `synonyms', `synonyms-append-result',</span>
<span class="linecomment">;;    `synonyms-append-result-no-read', `synonyms-definition',</span>
<span class="linecomment">;;    `synonyms-definition-mouse', `synonyms-definition-no-read',</span>
<span class="linecomment">;;    `synonyms-ensure-synonyms-read-from-cache',</span>
<span class="linecomment">;;    `synonyms-history-backward', `synonyms-history-forward',</span>
<span class="linecomment">;;    `synonyms-make-obarray', `synonyms-match-more',</span>
<span class="linecomment">;;    `synonyms-match-more-no-read',</span>
<span class="linecomment">;;    `synonyms-match-more+append-result',</span>
<span class="linecomment">;;    `synonyms-match-more+append-result-no-read', `synonyms-mode',</span>
<span class="linecomment">;;    `synonyms-mouse', `synonyms-mouse-append-result',</span>
<span class="linecomment">;;    `synonyms-mouse-match-more',</span>
<span class="linecomment">;;    `synonyms-mouse-match-more+append-result', `synonyms-no-read',</span>
<span class="linecomment">;;    `synonyms-write-synonyms-to-cache'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here -</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `synonyms-action', `synonyms-add-history-links',</span>
<span class="linecomment">;;    `synonyms-default-regexp', `synonyms-define-cache-file',</span>
<span class="linecomment">;;    `synonyms-define-synonyms-file', `synonyms-format-entries',</span>
<span class="linecomment">;;    `synonyms-format-entry', `synonyms-format-finish',</span>
<span class="linecomment">;;    `synonyms-format-synonyms',</span>
<span class="linecomment">;;    `synonyms-hack-backslashes-if-cygwin', `synonyms-lookup',</span>
<span class="linecomment">;;    `synonyms-nearest-word', `synonyms-file-readable-p',</span>
<span class="linecomment">;;    `synonyms-search-entries', `synonyms-search-synonyms',</span>
<span class="linecomment">;;    `synonyms-show-synonyms', `synonyms-file-writable-p'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here -</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `synonyms-history', `synonyms-history-forward',</span>
<span class="linecomment">;;    `synonyms-list-for-obarray', `synonyms-mode-map',</span>
<span class="linecomment">;;    `synonyms-obarray', `synonyms-search-text'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Key bindings made here - see `synonyms-mode'.  All key bindings</span>
<span class="linecomment">;;  are local to Synonyms mode; no global bindings are made here.</span>
 
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Acknowledgements</span>
<span class="linecomment">;;  ----------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The basic functionality provided here was derived from library</span>
<span class="linecomment">;;  `mthesaur.el', by Tad Ashlock &lt;taashlo@cyberdude.com&gt;.  That</span>
<span class="linecomment">;;  library, in turn, was inspired by library `thesaurus.el', by Ray</span>
<span class="linecomment">;;  Nickson.  Thanks also to those who sent helpful bug reports.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Note on MS Windows Emacs 20 and Cygwin `grep'</span>
<span class="linecomment">;;  ---------------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  There is apparently a bug in the Emacs (at least versions 20-22) C</span>
<span class="linecomment">;;  code that implements function `call-process' on MS Windows.  When</span>
<span class="linecomment">;;  using native Windows Emacs with Cygwin commands, such as `grep',</span>
<span class="linecomment">;;  the C code removes a level of backslashes in some cases, so string</span>
<span class="linecomment">;;  arguments supplied to `call-process' need to have twice as many</span>
<span class="linecomment">;;  backslashes as they should need in those cases.  It is for this</span>
<span class="linecomment">;;  reason that option `synonyms-use-cygwin-flag' is supplied here.</span>
<span class="linecomment">;;  When that option is non-nil, backslashes in regexps are hacked to</span>
<span class="linecomment">;;  do the right thing.  (In Emacs 20, this means doubling the</span>
<span class="linecomment">;;  backslashes; in Emacs 21-22, this means doubling them unless there</span>
<span class="linecomment">;;  are spaces in the search string.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Maybe To Do?</span>
<span class="linecomment">;;  ------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  1. It would be ideal to have not only synonym information but also</span>
<span class="linecomment">;;     definitions, antonyms, more general and more specific terms,</span>
<span class="linecomment">;;     filtering by part of speech (verb vs adjective etc.), and so</span>
<span class="linecomment">;;     on.  A good example of what I'd really like to have is provided</span>
<span class="linecomment">;;     by the free Windows program WordWeb (available here:</span>
<span class="linecomment">;;     http://wordweb.info/).  Combining that functionality with</span>
<span class="linecomment">;;     Icicles completion features would provide a great tool, IMO.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `synonyms-definition*' goes a long way toward providing this,</span>
<span class="linecomment">;;     and perhaps it is the best way to go, since there is so much</span>
<span class="linecomment">;;     more definitional info on the Web.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change Log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2012/03/02 dadams</span>
<span class="linecomment">;;     Require cl.el at compile time only for Emacs 20.</span>
<span class="linecomment">;; 2011/07/30 dadams</span>
<span class="linecomment">;;     Moved Icicles code to icicles-cmd2.el.  Removed soft-require of icicles.el.</span>
<span class="linecomment">;; 2011/02/11 dadams</span>
<span class="linecomment">;;     Better defaults for faces, for dark backgrounds.</span>
<span class="linecomment">;; 2011/01/04 dadams</span>
<span class="linecomment">;;     Added autoload cookies (for defgroup, defface, defcustom, and commands).</span>
<span class="linecomment">;; 2010/08/20 dadams</span>
<span class="linecomment">;;     synonyms - non-Icicles version: Made ARG optional too.</span>
<span class="linecomment">;;     synonyms(-no-read|-history-(backward|forward)):</span>
<span class="linecomment">;;       Use ARG, not current-prefix-arg.</span>
<span class="linecomment">;; 2010/01/12 dadams</span>
<span class="linecomment">;;     synonyms-history-(backward|forward): save-excursion + set-buffer -&gt; with-current-buffer.</span>
<span class="linecomment">;; 2007/12/05 dadams</span>
<span class="linecomment">;;     synonyms-obarray: Removed * doc-string prefix.</span>
<span class="linecomment">;; 2007/02/10 dadams</span>
<span class="linecomment">;;     icicle-sort-case-insensitively -&gt; icicle-case-insensitive-string-less-p.</span>
<span class="linecomment">;; 2006/12/22 dadams</span>
<span class="linecomment">;;     Renamed group synonyms to Synonyms.  :group 'icicles -&gt; :group 'Icicles.</span>
<span class="linecomment">;; 2006/03/31 dadams</span>
<span class="linecomment">;;     synonyms-write-synonyms-to-cache: Use prin1 instead of pp.</span>
<span class="linecomment">;; 2006/03/17 dadams</span>
<span class="linecomment">;;     synonyms-file-(read|writ)able-p: Put non-empty string condition first.</span>
<span class="linecomment">;; 2006/03/14 dadams</span>
<span class="linecomment">;;     synonyms-file-(read|writ)able-p: Make sure also not a directory.</span>
<span class="linecomment">;; 2006/03/12 dadams</span>
<span class="linecomment">;;     synonyms-ensure-synonyms-read-from-cache, synonyms-define-synonyms-file: </span>
<span class="linecomment">;;       Set synonyms(-cache)-file to expanded version.</span>
<span class="linecomment">;; 2006/03/01 dadams</span>
<span class="linecomment">;;     Updated Commentary to mention Icicles completion of synonyms.</span>
<span class="linecomment">;; 2006/02/02 dadams</span>
<span class="linecomment">;;     synonyms-define-cache-file: Fixed typo.</span>
<span class="linecomment">;; 2006/01/28 dadams</span>
<span class="linecomment">;;     synonyms-define-cache-file: wrap file-name-directory in expand-file-name.</span>
<span class="linecomment">;; 2006/01/19 dadams</span>
<span class="linecomment">;;     synonyms-format-finish: Minor tweak to regexp: space and tab, but not newline or formfeed.</span>
<span class="linecomment">;; 2006/01/18 dadams</span>
<span class="linecomment">;;     Added dictionary definition lookup:</span>
<span class="linecomment">;;       Added: synonyms-dictionary(-alternate)-url, synonyms-definition*.</span>
<span class="linecomment">;;       Bound synonyms-definition-*. </span>
<span class="linecomment">;; 2006/01/14 dadams</span>
<span class="linecomment">;;     Bug fixes -</span>
<span class="linecomment">;;     Make sure file name is expanded (thanks to Nikos Apostolakis): </span>
<span class="linecomment">;;       synonyms-search-(entries|synonyms): Expand file name.</span>
<span class="linecomment">;;       synonyms-define-*-file: Set variable after expanding file name.</span>
<span class="linecomment">;;       synonyms-format-entry, synonyms-history-*, synonyms-add-history-links:</span>
<span class="linecomment">;;         Raise error if search finds nothing.</span>
<span class="linecomment">;;     synonyms-hack-backslashes-if-cygwin: Don't double if spaces and not Emacs 20.</span>
<span class="linecomment">;;       Renamed synonyms-double-backslashes-if-cygwin to synonyms-hack-backslashes-if-cygwin.</span>
<span class="linecomment">;;     synonyms-mode-map: swapped bindings for C-mouse-2 and C-down-mouse-2, for Emacs 22.</span>
<span class="linecomment">;; 2006/01/11 dadams</span>
<span class="linecomment">;;     Fixed typo: require 'synonyms. (Thanks to Nikos Apostolakis.)</span>
<span class="linecomment">;; 2006/01/07 dadams</span>
<span class="linecomment">;;     Added :link.</span>
<span class="linecomment">;; 2006/01/04 dadams</span>
<span class="linecomment">;;     synonyms-format-finish: Don't skip numbered header, so highlight multiple synonyms in entry.</span>
<span class="linecomment">;; 2006/01/02 dadams</span>
<span class="linecomment">;;     Added: synonyms-define-cache-file, synonyms-define-synonyms-file,</span>
<span class="linecomment">;;            synonyms-file-readable-p, synonyms-file-writable-p.</span>
<span class="linecomment">;;     synonyms-make-obarray: Use synonyms-define-synonyms-file.</span>
<span class="linecomment">;;                            Use synonyms-mode, to get modified syntax (bug fix).</span>
<span class="linecomment">;;     synonyms-write-synonyms-to-cache: Use synonyms-define-cache-file.</span>
<span class="linecomment">;;     synonyms-ensure-synonyms-read-from-cache: Use synonyms-file-readable-p.</span>
<span class="linecomment">;;     synonyms(-cache)-file: Use empty string as initial value.</span>
<span class="linecomment">;;     Thanks to Alex Schroeder [alex@emacswiki.org] for suggestion to prompt for file names.</span>
<span class="linecomment">;; 2005/12/31 dadams</span>
<span class="linecomment">;;     Added menu-bar Synonyms menu.</span>
<span class="linecomment">;;     Renamed synonyms-read-synonyms-from-cache to synonyms-ensure-synonyms-read-from-cache.</span>
<span class="linecomment">;;       Call it from synonyms, not from synonyms-mode.</span>
<span class="linecomment">;;     Defined synonyms-mode-map per convention.</span>
<span class="linecomment">;;     synonyms-match-more, synonyms-append-result, synonyms-match-more+append-result:</span>
<span class="linecomment">;;       Use synonyms, not synonyms-no-read.</span>
<span class="linecomment">;;     Added: synonyms-*-no-read.  Bound those, not the new read versions.</span>
<span class="linecomment">;; 2005/12/29 dadams</span>
<span class="linecomment">;;     Treat modifiers with clicks on [Back] and [Forward] links.</span>
<span class="linecomment">;;     synonyms-history-(backward|forward): Add prefix arg.  Bind options.</span>
<span class="linecomment">;;     synonyms-mode, synonyms-lookup: Disable undo.</span>
<span class="linecomment">;; 2005/12/28 dadams</span>
<span class="linecomment">;;     Added: synonyms-history-(backward|forward), synonyms-add-history-links, synonyms-link.</span>
<span class="linecomment">;;     Added: [Back] and [Forward] links.</span>
<span class="linecomment">;;     synonyms-show-synonyms: Put cursor on first synonym.</span>
<span class="linecomment">;;     synonyms-mouse, synonyms-lookup: Removed save-excursion.</span>
<span class="linecomment">;;     synonyms-mouse: Treat clicks on [Back] and [Forward] links too.</span>
<span class="linecomment">;;     synonyms-format-finish: Added save-excursion for last part: filling and adding mouse-face.</span>
<span class="linecomment">;;     synonyms-nearest-word: Remove text properties.</span>
<span class="linecomment">;;     synonyms: Use synonym-action.</span>
<span class="linecomment">;;     synonyms-lookup: When no synonyms found, remove search-text from history.</span>
<span class="linecomment">;;     Require cl.el when compile.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to the</span>
<span class="linecomment">;; Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; ;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (when (&lt; emacs-major-version 21) (require 'cl))) <span class="linecomment">;; push, pop</span>

(require 'thingatpt+ nil t) <span class="linecomment">;; (no error if not found): word-nearest-point</span>
(require 'thingatpt nil t)  <span class="linecomment">;; (no error if not found): word-at-point</span>

<span class="linecomment">;; Note: You might get byte-compiler warnings that variables `appendp'</span>
<span class="linecomment">;;       and `morep' are free: .  This is OK.</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;</span>



 
<span class="linecomment">;;; Faces (alphabetical) -----------------------------------</span>

<span class="linecomment">;;;###autoload</span>
(defgroup Synonyms nil
  "<span class="quote">Commands to look up synonyms in a thesaurus.</span>"
  :prefix "<span class="quote">synonyms-</span>"
  :group 'convenience :group 'help :group 'apropos :group 'matching
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
synonyms.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>" "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/synonyms.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>" "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Synonyms</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Commentary</span>" "<span class="quote">synonyms</span>"))

<span class="linecomment">;;;###autoload</span>
(defface synonyms-heading '((((background dark)) (:foreground "<span class="quote">Yellow</span>"))
                            (t (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face for different synonym types.</span>"
  :group 'Synonyms :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface synonyms-search-text '((t (:foreground "<span class="quote">Red</span>")))
  "<span class="quote">*Face for the term whose synonyms were sought.</span>"
  :group 'Synonyms :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface synonyms-link '((((background dark)) (:foreground "<span class="quote">Yellow</span>" :underline t))
                         (t (:foreground "<span class="quote">Blue</span>" :underline t)))
  "<span class="quote">*Face for history links.</span>"
  :group 'Synonyms :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface synonyms-mouse-face '((((background dark)) (:background "<span class="quote">DarkCyan</span>"))
                               (t (:background "<span class="quote">Cyan</span>")))
  "<span class="quote">*Mouse face for the term whose synonyms were sought.</span>"
  :group 'Synonyms :group 'faces)



 
<span class="linecomment">;;; User Options (alphabetical) ----------------------------</span>

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-append-result-flag nil
  "<span class="quote">*t means that `synonyms' appends search result to previous results.
No other value, besides t, has this effect.

This can be overridden by using a negative prefix argument,
for example, `M--'.  If you use `C-u C-u', then both this and
`synonyms-match-more-flag' are overridden.</span>"
  :type 'boolean :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-cache-file "<span class="quote"></span>"
  "<span class="quote">*Location to write cache file containing synonyms.
Written to save the list of synonyms used for completion.
This is an absolute (complete-path) location, including the file name.</span>"
  :type '(file :must-match t) :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-file "<span class="quote"></span>"
  "<span class="quote">*Location of thesaurus file `mthesaur.txt'.
This is an absolute (complete-path) location, including the file name.</span>"
  :type '(file :must-match t) :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-fill-column 80
  "<span class="quote">*Synonyms* buffer text is wrapped (filled) to this many columns.</span>"
  :type 'integer :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-match-more-flag nil
  "<span class="quote">*t means additional thesaurus entries can be matched by `synonyms'.
No other value, besides t, has this effect.

A value of t means two things:
 1) Input can match parts of synonyms, in addition to whole synonyms.
 2) All synonyms are shown, even if input matches a thesaurus entry.

This can be overridden by using a positive prefix argument,
  for example, `C-u'.  If you use `C-u C-u', then both this and
`synonyms-append-result-flag' are overridden.</span>"
  :type 'boolean :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-mode-hook nil
  "<span class="quote">*Normal hook run when entering Thesaurus mode.</span>"
  :type 'hook :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-use-cygwin-flag nil
  "<span class="quote">*Non-nil means to double backslashes in arguments to `call-process'.
There is apparently a bug in the Emacs (at least versions 20-22) C
code that implements function `call-process' on MS Windows.  When
using native Windows Emacs with Cygwin commands, such as `grep', the C
code removes a level of backslashes, so string arguments supplied to
`call-process' need to have twice as many backslashes as they should
need.  If you are using Emacs on Windows and Cygwin `grep', then you
probably will want to use a non-nil value for
`synonyms-use-cygwin-flag'.</span>"
  :type 'boolean :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-dictionary-url "<span class="quote">http://dictionary.reference.com/search?q=</span>"
  "<span class="quote">*URL of a Web dictionary lookup.  Text to look up is appended to this.
See also `synonyms-dictionaries-url'.</span>"
  :type 'string :group 'Synonyms)

<span class="linecomment">;;;###autoload</span>
(defcustom synonyms-dictionary-alternate-url "<span class="quote">http://www.onelook.com/?ls=b&w=</span>"
  "<span class="quote">*URL of a Web dictionary lookup.  Text to look up is appended to this.
The default value, \"http://www.onelook.com/?ls=b&w=\" lets you use `?'
and `*' as wildcards in the terms you look up.  These are not used as
regexp wildcards, however.  `?' stands for any single character, and
`*' stands for any sequence of characters.  In terms of regexp syntax,
`?' here is equivalent to the regexp `.', and `*' is equivalent to the
regexp `.*'.  See http://www.onelook.com/?c=faq#patterns for more
information on the allowed wildcard patterns.
See also `synonyms-dictionary-url'.</span>"
  :type 'string :group 'Synonyms)
 
<span class="linecomment">;;; Internal variables (alphabetical) ----------------------</span>

(defvar synonyms-history nil "<span class="quote">Minibuffer history list for thesaurus lookup.</span>")

(defvar synonyms-history-forward nil
  "<span class="quote">Minibuffer history list for thesaurus lookup using `synonyms-history-backward'.</span>")

(defvar synonyms-list-for-obarray nil "<span class="quote">List of synonyms to be used for completion</span>")

(defvar synonyms-mode-map nil "<span class="quote">Keymap for `synonyms-mode'.</span>")

(unless synonyms-mode-map
  (let ((map  (make-sparse-keymap "<span class="quote">Synonyms</span>")))
    (define-key map [(?d) (mouse-2)] 'synonyms-definition-mouse)
    (define-key map "<span class="quote">d\r</span>"            'synonyms-definition-no-read)
    (define-key map "<span class="quote">s</span>"              'synonyms)
    (define-key map [S-return]       'synonyms)
    (define-key map "<span class="quote">\r</span>"             'synonyms-no-read)
    (define-key map [C-return]       'synonyms-match-more-no-read)
    (define-key map [M-return]       'synonyms-append-result-no-read)
    (define-key map [C-M-return]     'synonyms-match-more+append-result-no-read)
    (define-key map [mouse-2]        'synonyms-mouse)
    (define-key map [C-mouse-2]      'undefined)
    (define-key map [C-down-mouse-2] 'synonyms-mouse-match-more) <span class="linecomment">; Get rid of `facemenu-mouse-menu'</span>
    (define-key map [M-mouse-2]      'synonyms-mouse-append-result)
    (define-key map [C-M-mouse-2]    'synonyms-mouse-match-more+append-result)
    (define-key map "<span class="quote">l</span>"              'synonyms-history-backward) <span class="linecomment">; As in Info</span>
    (define-key map "<span class="quote">p</span>"              'synonyms-history-backward) <span class="linecomment">; As in previous</span>
    (define-key map "<span class="quote">r</span>"              'synonyms-history-forward) <span class="linecomment">; As in Info</span>
    (define-key map "<span class="quote">n</span>"              'synonyms-history-forward) <span class="linecomment">; As in next</span>
    (define-key map [mouse-4]        'synonyms-history-backward)
    (define-key map [mouse-5]        'synonyms-history-forward)
    (define-key map "<span class="quote"> </span>"              'scroll-up) <span class="linecomment">; SPC</span>
    (define-key map "<span class="quote">\^?</span>"            'scroll-down) <span class="linecomment">; DEL</span>
    (define-key map "<span class="quote">?</span>"              'describe-mode)
    (define-key map "<span class="quote">q</span>"              'quit-window)
    (define-key map [menu-bar]             (make-sparse-keymap))
    (define-key map [menu-bar synonyms]    (cons "<span class="quote">Synonyms</span>" map))
    (define-key map [synonyms-help]        '("<span class="quote">Help</span>" . describe-mode))
    (define-key map [synonyms-separator-2] '("<span class="quote">--</span>"))
    (define-key map [synonyms-next]        '("<span class="quote">Show Next</span>" . synonyms-history-forward))
    (put 'synonyms-history-forward 'menu-enable 'synonyms-history-forward)
    (define-key map [synonyms-previous]    '("<span class="quote">Show Previous</span>" . synonyms-history-backward))
    (put 'synonyms-history-backward 'menu-enable '(and synonyms-history (cdr synonyms-history)))
    (define-key map [synonyms-separator]   '("<span class="quote">--</span>"))
    (define-key map [synonyms-more-append]
      '("<span class="quote">Find (Max), Append Results</span>" . synonyms-match-more+append-result))
    (define-key map [synonyms-append]
      '("<span class="quote">Find, Append Results</span>" . synonyms-append-result))
    (define-key map [synonyms-more]        '("<span class="quote">Find (Max)</span>" . synonyms-match-more))
    (define-key map [synonyms-synonyms]    '("<span class="quote">Find</span>" . synonyms))
    (setq synonyms-mode-map  map)))

<span class="linecomment">;; 103307 is the smallest prime &gt; 103304, which is the number of synonyms.</span>
(defvar synonyms-obarray (make-vector 103307 0)
  "<span class="quote">Obarray of synonyms.  Used for completion.</span>")

(defvar synonyms-search-text nil "<span class="quote">Current text being looked up (matched).</span>")



 
<span class="linecomment">;;; Functions ----------------------------------------------</span>

<span class="linecomment">;;;###autoload</span>
(define-derived-mode synonyms-mode text-mode "<span class="quote">Synonyms</span>"
  "<span class="quote">Major mode for browsing thesaurus entries (synonyms).
Like Text mode but with these additional key bindings:

 \\&lt;synonyms-mode-map&gt;\\[synonyms-mouse],     \\[synonyms-no-read],     \\[synonyms] - \
Look up synonyms for a word or phrase
 \\[synonyms-mouse-match-more],   \\[synonyms-match-more]   - Like \\[synonyms-no-read], but \
try to match more terms
 \\[synonyms-mouse-append-result],   \\[synonyms-append-result]   - Like \\[synonyms-no-read], but \
add result to previous result
 \\[synonyms-mouse-match-more+append-result], \\[synonyms-match-more+append-result] - Like \
\\[synonyms-match-more] and \\[synonyms-append-result] combined

 \\[scroll-up] - Scroll down through the buffer of synonyms
 \\[scroll-down] - Scroll up through the buffer of synonyms
 \\[describe-mode]   - Display this help
 \\[quit-window]   - Quit Synonyms mode

Of the various key bindings that look up synonyms, the most flexible
is \\[synonyms] - it prompts you for the search string to match.  This
can be a regular expression (regexp).  The other lookup bindings are
for convenience - just click.

In Synonyms mode, Transient Mark mode is enabled.

Options `synonyms-match-more-flag' and `synonyms-append-result-flag'
affect synonym matching and the results.  For convenience, \\[synonyms-mouse-match-more],
\\[synonyms-mouse-append-result], and \\[synonyms-mouse-match-more+append-result] \
toggle the effect of those options for the
duration of the command.

Note that even though Synonyms mode is similar to Text mode, buffer
`*Synonyms*' is read-only, by default - use `C-x C-q' to toggle.

Turning on Synonyms mode runs the normal hooks `text-mode-hook' and
`synonyms-mode-hook' (in that order).</span>"

  <span class="linecomment">;; Synonyms to account for:</span>
  <span class="linecomment">;; `$', `1', `0': $100-a-plate dinner; `2': catch-22, V-2; `3': 3-D; `9': strontium 90.</span>
  <span class="linecomment">;; To match `$', you will of course need to escape it: `\$'.</span>
  (modify-syntax-entry ?- "<span class="quote">w</span>" synonyms-mode-syntax-table) <span class="linecomment">; Make hyphen (-) a word character.</span>
  (modify-syntax-entry ?1 "<span class="quote">w</span>" synonyms-mode-syntax-table) <span class="linecomment">; Make numerals 1,2,3,9,0 word characters.</span>
  (modify-syntax-entry ?2 "<span class="quote">w</span>" synonyms-mode-syntax-table)
  (modify-syntax-entry ?3 "<span class="quote">w</span>" synonyms-mode-syntax-table)
  (modify-syntax-entry ?9 "<span class="quote">w</span>" synonyms-mode-syntax-table)
  (modify-syntax-entry ?0 "<span class="quote">w</span>" synonyms-mode-syntax-table)
  (modify-syntax-entry ?$ "<span class="quote">w</span>" synonyms-mode-syntax-table) <span class="linecomment">; Make dollar ($) a word character.</span>
  (buffer-disable-undo)
  (setq fill-column  synonyms-fill-column)
  (set (make-local-variable 'transient-mark-mode) t))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-ensure-synonyms-read-from-cache ()
  "<span class="quote">Ensure synonyms are in `synonyms-obarray', from `synonyms-cache-file'.
If this file does not yet exist, then it and the obarray are created.
Creating the obarray for the first time takes 2-3 minutes.
This does nothing if the obarray is already complete.</span>"
  (interactive)
  (unless (intern-soft "<span class="quote">synonym</span>" synonyms-obarray) <span class="linecomment">; Do nothing if already complete.</span>
    (setq synonyms-list-for-obarray  () <span class="linecomment">; Just to make sure.</span>
          synonyms-cache-file        (expand-file-name synonyms-cache-file))
    (if (synonyms-file-readable-p synonyms-cache-file)
        (let ((list-buf  (find-file-noselect synonyms-cache-file 'nowarn 'raw))
              (obarray   synonyms-obarray))
          (unwind-protect
               (setq synonyms-list-for-obarray  (read list-buf))
            (kill-buffer list-buf)))
      (synonyms-make-obarray)           <span class="linecomment">; Create obarray from scratch</span>
      (synonyms-write-synonyms-to-cache)))) <span class="linecomment">; and write it out, for next time.</span>

<span class="linecomment">;;;###autoload</span>
(defun synonyms-make-obarray ()
  "<span class="quote">Fill `synonyms-obarray' with the available synonyms.</span>"
  (interactive)
  (unless (intern-soft "<span class="quote">synonym</span>" synonyms-obarray) <span class="linecomment">; Do nothing if already complete.</span>
    (synonyms-define-synonyms-file)
    (with-temp-message "<span class="quote">Building synonyms list for completion.  This will take a few minutes...</span>"
      (let ((thesaurus-buf  (find-file-noselect synonyms-file 'nowarn 'raw))
            synonym)
        (unwind-protect
             (save-current-buffer
               (set-buffer thesaurus-buf)
               (goto-char (point-min))
               (synonyms-mode)          <span class="linecomment">; To use the modified syntax table.</span>
               (while (re-search-forward "<span class="quote">\\(\\(\\w\\|[ ]\\)+\\)\\(,\\|$\\)</span>" nil t)
                 (setq synonym  (buffer-substring (match-beginning 1) (match-end 1)))
                 (intern synonym synonyms-obarray)))
          (kill-buffer thesaurus-buf))))))

(defun synonyms-define-synonyms-file ()
  "<span class="quote">Prompt user to define `synonyms-file', unless it is readable.</span>"
  (setq synonyms-file  (expand-file-name synonyms-file))
  (unless (synonyms-file-readable-p synonyms-file)
    (while (not (synonyms-file-readable-p synonyms-file))
      (setq synonyms-file  (read-file-name "<span class="quote">Thesaurus file: </span>" nil nil 'confirm "<span class="quote">mthesaur.txt</span>")))
    (custom-set-variables (list 'synonyms-file
                                (setq synonyms-file  (expand-file-name synonyms-file))
                                'now))))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-write-synonyms-to-cache ()
  "<span class="quote">Write synonyms in `synonyms-obarray' to file `synonyms-cache-file'.</span>"
  (interactive)
  (synonyms-define-cache-file)
  (with-temp-message "<span class="quote">Writing synonyms cache file...</span>"
    (with-temp-file synonyms-cache-file
      (mapatoms (lambda (symb) (push symb synonyms-list-for-obarray)) synonyms-obarray)
      (prin1 synonyms-list-for-obarray (current-buffer)))))

(defun synonyms-define-cache-file ()
  "<span class="quote">Prompt user to define `synonyms-cache-file', unless it is writable.</span>"
  (unless (synonyms-file-writable-p synonyms-cache-file)
    (while (not (synonyms-file-writable-p synonyms-cache-file))
      (setq synonyms-cache-file
            (read-file-name "<span class="quote">Cache file: </span>"
                            (expand-file-name (file-name-directory synonyms-file)) nil nil
                            (concat (file-name-nondirectory synonyms-file) "<span class="quote">.cache</span>"))))
    (custom-set-variables (list 'synonyms-cache-file
                                (setq synonyms-cache-file  (expand-file-name synonyms-cache-file))
                                'now))))

(defun synonyms-file-readable-p (file)
  "<span class="quote">Return non-nil if FILE (a string) names a readable file.</span>"
  (and (not (string= "<span class="quote"></span>" file)) (file-readable-p file) (not (file-directory-p file))))

(defun synonyms-file-writable-p (file)
  "<span class="quote">Return non-nil if FILE (a string) names a writable file.</span>"
  (and (not (string= "<span class="quote"></span>" file)) (file-writable-p file) (not (file-directory-p file))))

(defun synonyms (&optional arg regexp)
  "<span class="quote">Show synonyms that match a regular expression (e.g. a word or phrase).
You are prompted for the regexp.  By default, it is the text
of the region, if it is active and `transient-mark-mode' is enabled,
or the nearest word to the cursor, if not.

Option `synonyms-match-more-flag' non-nil means additional thesaurus
  entries can be matched.  This can be more time-consuming.  It means
  two things:

  1) Input can match parts of synonyms, in addition to whole synonyms.
  2) All synonyms are shown, even if input matches a thesaurus entry.

Option `synonyms-append-result-flag' non-nil means to append search
  result to previous results.

A prefix argument toggles the meaning of each of those options for the
duration of the command:

  If `C-u' or `C-u C-u', then toggle `synonyms-match-more-flag'.
  If negative or `C-u C-u', then toggle `synonyms-append-result-flag'.

\(`C-u C-u' thus means toggle both options.)

When called from Lisp, optional second argument REGEXP is the regexp
to match (no prompting).</span>"
  (interactive "<span class="quote">P</span>")
  (synonyms-ensure-synonyms-read-from-cache) <span class="linecomment">; Fill `synonyms-obarray', for use in completion.</span>
  (let* ((num-arg              (prefix-numeric-value arg))
         (morep                (eq synonyms-match-more-flag (atom arg)))
         (appendp              (eq synonyms-append-result-flag (and (wholenump num-arg)
                                                                    (/= 16 num-arg))))
         (default-search-text  (or regexp (synonyms-default-regexp)))
         (search-text          (or regexp
                                   (let ((case-fold-search  t)) <span class="linecomment">; Case-insensitive completion.</span>
                                     (completing-read
                                      "<span class="quote">Show synonyms for word or phrase (regexp): </span>"
                                      synonyms-obarray nil nil nil 'synonyms-history
                                      default-search-text)))))
    (synonyms-action search-text)))

(defun synonyms-action (search-text)
  "<span class="quote">Helper function for command `synonyms'.
APPENDP and MOREP are free here.</span>"
  (setq synonyms-search-text  search-text) <span class="linecomment">; Save it.</span>
  (when (string= "<span class="quote"></span>" search-text) (error "<span class="quote">No text to look up</span>"))
  (unless (member search-text synonyms-history) (push search-text synonyms-history))
  <span class="linecomment">;; Change `.' to `[^,]' in `search-text', so we don't mix terms.</span>
  (setq search-text  (replace-regexp-in-string "<span class="quote">\\.</span>" "<span class="quote">[^,]</span>" search-text nil t))
  (synonyms-lookup search-text (and (boundp 'appendp) appendp) (and (boundp 'morep) morep)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-no-read (arg)
  "<span class="quote">Same as command `synonyms', but uses the default input text (regexp).</span>"
  (interactive "<span class="quote">P</span>")
  (let* ((num-arg      (prefix-numeric-value arg))
         (morep        (eq synonyms-match-more-flag (atom arg)))
         (appendp      (eq synonyms-append-result-flag (and (wholenump num-arg) (/= 16 num-arg))))
         (search-text  (synonyms-default-regexp)))
    (setq synonyms-search-text  search-text) <span class="linecomment">; Save it.</span>
    (when (string= "<span class="quote"></span>" search-text) (error "<span class="quote">No text to look up</span>"))
    (unless (member search-text synonyms-history) (push search-text synonyms-history))
    <span class="linecomment">;; Change `.' to `[^,]' in `search-text', so we don't mix terms.</span>
    (setq search-text  (replace-regexp-in-string "<span class="quote">\\.</span>" "<span class="quote">[^,]</span>" search-text nil t))
    (synonyms-lookup search-text appendp morep)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-match-more ()
  "<span class="quote">Same as using `synonyms' with `synonyms-match-more-flag' = t.</span>"
  (interactive)
  (let ((synonyms-match-more-flag  t))
    (synonyms)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-match-more-no-read (arg)
  "<span class="quote">Same as using `synonyms' with `synonyms-match-more-flag' = t.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((synonyms-match-more-flag  t))
    (synonyms-no-read arg)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-append-result ()
  "<span class="quote">Same as using `synonyms' with `synonyms-append-result-flag' = t.</span>"
  (interactive)
  (let ((synonyms-append-result-flag  t))
    (synonyms)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-append-result-no-read (arg)
  "<span class="quote">Same as using `synonyms' with `synonyms-append-result-flag' = t.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((synonyms-append-result-flag  t))
    (synonyms-no-read arg)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-match-more+append-result ()
  "<span class="quote">Like `synonyms-match-more-flag' = `synonyms-append-result-flag' = t.</span>"
  (interactive)
  (let ((synonyms-match-more-flag     t)
        (synonyms-append-result-flag  t))
    (synonyms)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-match-more+append-result-no-read (arg)
  "<span class="quote">Like `synonyms-match-more-flag' = `synonyms-append-result-flag' = t.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((synonyms-match-more-flag     t)
        (synonyms-append-result-flag  t))
    (synonyms-no-read arg)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-mouse (event arg)
  "<span class="quote">Show synonyms that match a regular expression (e.g. a word or phrase).
The regexp to match is the synonym or region clicked with mouse-2.  If
the region is active, but a synonym elsewhere is clicked, that synonym
is used, not the selected text.

You can either click a listed synonym, to see its synonyms, or select
one or more words and click the selection, to see matching synonyms.
To quickly select a series of words: double-click mouse-1 to select
the first word, then click mouse-3 to extend the selection to the last
word.

Selection is useful when you want to see synonyms of a similar term.
For example, instead of clicking the listed synonym `bleeding heart', you
might select `heart' and click that.

The prefix argument acts the same as for command `synonyms'.

If you click a history link with mouse-2, previously retrieved search
results are revisited.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (set-buffer (window-buffer (posn-window (event-end event))))
  (let ((beg     (region-beginning))
        (end     (region-end))
        (active  mark-active))
    (goto-char (posn-point (event-end event)))
    (cond ((get-text-property (point) 'back-link) (synonyms-history-backward nil))
          ((get-text-property (point) 'forward-link) (synonyms-history-forward nil))
          (t (if (and active (&gt; (point) beg) (&lt; (point) end))
                 (goto-char end)
               (deactivate-mark))       <span class="linecomment">; User did not click inside region, so deactivate it.</span>
             (synonyms-no-read arg)))))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-mouse-match-more (event arg)
  "<span class="quote">Same as `synonyms-mouse' with `synonyms-match-more-flag' = t.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (let ((synonyms-match-more-flag  t))
    (synonyms-mouse event arg)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-mouse-append-result (event arg)
  "<span class="quote">Same as `synonyms-mouse' with `synonyms-append-result-flag' = t.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (let ((synonyms-append-result-flag  t))
    (synonyms-mouse event arg)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-mouse-match-more+append-result (event arg)
  "<span class="quote">Like `synonyms-match-more-flag' = `synonyms-append-result-flag' = t.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (let ((synonyms-match-more-flag     t)
        (synonyms-append-result-flag  t))
    (synonyms-mouse event arg)))

(defun synonyms-default-regexp ()
  "<span class="quote">Return the default regexp for `synonym' and `synonyms-mouse'.
If the region is active in `transient-mark-mode', use its text.
Else, if this is *Synonyms* buffer, use the synonym under the cursor.
Else use the word nearest the cursor.

An active region has no effect except in `transient-mark-mode'.</span>"
  (if (and mark-active transient-mark-mode) <span class="linecomment">; Use region text, if active.</span>
      (buffer-substring-no-properties (point) (mark))
    (if (eq major-mode 'synonyms-mode)  <span class="linecomment">; Use mouse-face text, if in synonyms-mode.</span>
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (when (and (not (bobp)) (get-text-property (1- (point)) 'mouse-face))
            (setq end  (1- (point))
                  beg  (point)))
          (if (null beg)
              (synonyms-nearest-word)   <span class="linecomment">; Punt - no mouse-face, for some reason.</span>
            (setq beg  (previous-single-property-change beg 'mouse-face)
                  end  (or (next-single-property-change end 'mouse-face) (point-max)))
            (replace-regexp-in-string   <span class="linecomment">; Replace newlines with spaces, except at the</span>
             "<span class="quote">\\(^ \\| $\\)</span>" "<span class="quote"></span>"         <span class="linecomment">; beginning and end.</span>
             (replace-regexp-in-string "<span class="quote">[\n]</span>" "<span class="quote"> </span>" (buffer-substring-no-properties beg end) nil t)
             nil t)))
      (synonyms-nearest-word))))

(defun synonyms-nearest-word ()
  "<span class="quote">Word nearest the cursor.</span>"
  (let ((word  (if (fboundp 'word-nearest-point)
                   (word-nearest-point) <span class="linecomment">; In `thingatpt+.el'.</span>
                 (word-at-point))))     <span class="linecomment">; In `thingatpt.el'.</span>
    (set-text-properties 0 (length word) nil word) <span class="linecomment">; Remove all text properties.</span>
    word))

(defun synonyms-lookup (search-text appendp morep)
  "<span class="quote">Search the thesaurus for SEARCH-TEXT.
APPEND-P non-nil means to append search result to previous results.
MORE-P non-nil means additional thesaurus entries can be matched.</span>"
  (save-selected-window
    (with-temp-message
        (format "<span class="quote">Looking up %s synonyms for \"%s\"%s...</span>" (if morep "<span class="quote">(max)</span>" "<span class="quote"></span>")
                (replace-regexp-in-string (regexp-quote "<span class="quote">[^,]</span>") "<span class="quote">.</span>" search-text nil t)
                (if appendp "<span class="quote"> (appending)</span>" "<span class="quote"></span>"))
      (let ((temp-buf  (generate-new-buffer "<span class="quote"> *Temp*</span>")))
        (unwind-protect
             (progn
               (set-buffer temp-buf)
               (buffer-disable-undo)    <span class="linecomment">; Make sure (should already be, because of *Temp* name).</span>
               (erase-buffer)
               (let ((entry-p  (synonyms-search-entries search-text temp-buf morep)))
                 <span class="linecomment">;; For `morep' search, we don't stop even if we find an entry.</span>
                 (unless (if morep
                             (or (synonyms-search-synonyms search-text temp-buf t) entry-p)
                           (or entry-p (synonyms-search-synonyms search-text temp-buf nil)))
                   (pop synonyms-history) <span class="linecomment">; Remove it from search history, so we don't try again.</span>
                   (error "<span class="quote">No synonyms found for `%s'</span>" search-text))
                 (let ((results-buf  (get-buffer-create "<span class="quote">*Synonyms*</span>")))
                   (synonyms-format-synonyms search-text morep)
                   (synonyms-show-synonyms temp-buf results-buf appendp)
                   (message nil))))
          (kill-buffer temp-buf))))))

(defun synonyms-search-entries (search-text buf morep)
  "<span class="quote">Search thesaurus entries (headings) for SEARCH-TEXT.
Put result in buffer BUF.
MORE-P non-nil means additional thesaurus entries can be matched.</span>"
  (call-process "<span class="quote">grep</span>" nil buf nil "<span class="quote">-i</span>" (synonyms-hack-backslashes-if-cygwin
                                         (if morep
                                             (format "<span class="quote">^\\w*%s\\w*,</span>" search-text)
                                           (format "<span class="quote">^%s,</span>" search-text)))
                (expand-file-name synonyms-file))
  (not (zerop (count-lines (point-min) (point-max)))))

(defun synonyms-search-synonyms (search-text buf morep)
  "<span class="quote">Search thesaurus body for SEARCH-TEXT.
SEARCH-TEXT is a regexp that can match any part of a thesaurus term.
Put result in buffer BUF.
MORE-P non-nil means additional thesaurus entries can be matched.</span>"
  (call-process "<span class="quote">grep</span>" nil buf nil "<span class="quote">-i</span>" (synonyms-hack-backslashes-if-cygwin
                                         (if morep
                                             (format "<span class="quote">,\\w*%s\\w*\\(,\\|$\\)</span>" search-text)
                                           (format "<span class="quote">,%s\\(,\\|$\\)</span>" search-text)))
                (expand-file-name synonyms-file))
  (not (zerop (count-lines (point-min) (point-max)))))

(defun synonyms-hack-backslashes-if-cygwin (string)
  "<span class="quote">Double each backslash in STRING, unless it contains SPC characters.
More precisely, if `synonyms-use-cygwin-flag' is non-nil and this is
Emacs 20 or there are no spaces in STRING, then double any backslashes
in STRING.

This is an ugly hack made necessary because of bugs in Emacs C code.</span>"
  (when (and synonyms-use-cygwin-flag
             (or (= emacs-major-version 20) (not (string-match "<span class="quote"> </span>" string))))
    (setq string  (replace-regexp-in-string "<span class="quote">[\\]</span>" "<span class="quote">\\\\</span>" string nil t)))  
  string)

(defun synonyms-format-synonyms (search-text morep)
  "<span class="quote">Format synonyms that match SEARCH-TEXT.
MORE-P non-nil means additional thesaurus entries can be matched.</span>"
  (goto-char (point-min))
  (let ((entries-count  (count-lines (point-min) (point-max))))
    (if (= entries-count 1)
        (synonyms-format-entry search-text t morep)
      (synonyms-format-entries search-text entries-count morep))
    (synonyms-format-finish search-text morep)))

(defun synonyms-format-entry (search-text single-p morep)
  "<span class="quote">Format a single thesaurus entry that matches SEARCH-TEXT.
SINGLE-P non-nil means there is only one entry.</span>"
  (beginning-of-line)
  (let ((beg      (point))
        (orig     (if morep             <span class="linecomment">; Use saved search text.</span>
                      (format "<span class="quote">\\w*\\(%s\\)\\w*</span>" synonyms-search-text)
                    (format "<span class="quote">\\(%s\\)</span>" synonyms-search-text)))
        (entry-p  nil)
        term end)
    (when single-p (insert "<span class="quote">Synonyms for </span>"))
    (setq term  (point))
    (when (looking-at orig) (setq entry-p t))
    (unless (search-forward "<span class="quote">,</span>" nil t) (error "<span class="quote">Bad thesaurus file - no commas</span>"))
    (setq end  (match-beginning 0))
    (replace-match "<span class="quote">:\n\n</span>" nil t)
    (cond (single-p
           (add-text-properties beg term '(face synonyms-heading))
           (add-text-properties term end (if entry-p
                                             '(face synonyms-search-text
                                               mouse-face synonyms-mouse-face)
                                           '(face synonyms-heading)))
           (add-text-properties end (+ 2 end) '(face synonyms-heading)))
          (t
           (add-text-properties beg (1+ end) '(face synonyms-heading))
           (save-excursion
             (forward-line -2)
             (save-restriction
               (narrow-to-region (point) (save-excursion (end-of-line) (backward-char) (point)))
               (unless (search-forward "<span class="quote">. </span>" nil t)
                 (error "<span class="quote">Badly formatted numeric entry - no period</span>"))
               (add-text-properties (point) (point-max) '(mouse-face synonyms-mouse-face))
               (when (looking-at orig)
                 (add-text-properties (match-beginning 1) (match-end 1)
                                      '(face synonyms-search-text)))))))
    (forward-line)))

(defun synonyms-format-entries (search-text entries-count morep)
  "<span class="quote">Format thesaurus entries that have synonyms matching SEARCH TEXT.
ENTRIES-COUNT is the number of entries.
MORE-P non-nil means additional thesaurus entries can be matched.</span>"
  (let ((countdown  entries-count)
        (beg        (point))
        (part1      "<span class="quote">Synonyms for </span>")
        (part2      "<span class="quote">:\n</span>"))
    (insert part1 synonyms-search-text part2)
    (add-text-properties beg (setq beg  (+ beg (length part1))) '(face synonyms-heading))
    (add-text-properties beg (setq beg  (+ beg (length synonyms-search-text)))
                         '(face synonyms-search-text mouse-face synonyms-mouse-face))
    (add-text-properties beg (+ beg (length part2)) '(face synonyms-heading))
    (while (&gt; countdown 0)
      (setq countdown  (1- countdown))
      (insert (format "<span class="quote">\n\%s. </span>" (- entries-count countdown)))
      (synonyms-format-entry search-text nil morep))))

(defun synonyms-format-finish (search-text morep)
  "<span class="quote">Finish formatting synonyms matching SEARCH-TEXT.
MORE-P non-nil means additional thesaurus entries can be matched.</span>"
  <span class="linecomment">;; Put a space after each comma.</span>
  (goto-char (point-min))
  (forward-line)                        <span class="linecomment">; First line might have [^,] in it.</span>
  (while (search-forward "<span class="quote">,</span>" nil t) (replace-match "<span class="quote">, </span>" nil t))
  (goto-char (point-min))
  (let ((case-fold-search       t)
        (new-search-text        (if morep
                                    (format "<span class="quote">\\(^\\|, \\)\\w*\\(%s\\)\\w*\\($\\|,\\)</span>" search-text)
                                  (format "<span class="quote">\\(^\\|, \\)\\(%s\\)\\($\\|,\\)</span>" search-text)))
        (no-numbered-headers-p  (not (re-search-forward "<span class="quote">^[0-9]+[.]</span>" nil t))))
    (goto-char (point-min))
    (forward-line)
    (while (re-search-forward new-search-text nil t)
      (add-text-properties (match-beginning 2) (match-end 2) '(face synonyms-search-text))
      (goto-char (match-end 2)))
    <span class="linecomment">;; Do `synonyms-mode' here too, so hyphen will be a word char.</span>
    <span class="linecomment">;; IS THERE A WAY TO DO A LET to change the syntax of hyphen, instead of entering mode?</span>
    (synonyms-mode)
    (save-excursion
      (goto-char (point-min))
      (forward-line)
      (while (re-search-forward "<span class="quote">\\(^\\|, \\)\\(\\(\\w\\|[\\t ]\\)+\\)\\($\\|,\\)</span>" nil t)
        (add-text-properties (match-beginning 2) (match-end 2) '(mouse-face synonyms-mouse-face))
        (goto-char (match-end 2)))
      (fill-region (point-min) (point-max)))
    (synonyms-add-history-links)))

(defun synonyms-add-history-links ()
  "<span class="quote">Add Back and Forward chronological navigation links</span>"
  (save-excursion
    (unless (re-search-backward "<span class="quote">Synonyms for</span>") (error "<span class="quote">No \"Synonyms for\" text</span>"))
    (end-of-line)
    (insert (make-string (- fill-column 16 (point)) ?\ ) "<span class="quote">[</span>")
    (let ((beg      (point))
          (Back     "<span class="quote">Back</span>")
          (spacer   "<span class="quote">]  [</span>")
          (Forward  "<span class="quote">Forward</span>"))
      (insert Back)
      (add-text-properties beg (point)
                           '(face synonyms-link mouse-face synonyms-mouse-face back-link t
                             help-echo "<span class="quote">mouse-2, RET: Go backward in synonyms search history</span>"))
      (insert spacer Forward)
      (add-text-properties (+ beg (length Back) (length spacer)) (point)
                           '(face synonyms-link mouse-face synonyms-mouse-face forward-link t
                             help-echo "<span class="quote">mouse-2, RET: Go forward in synonyms search history</span>"))
      (insert "<span class="quote">]</span>"))))

(defun synonyms-show-synonyms (temp-buf results-buf appendp)
  "<span class="quote">Display search results from buffer TEMP-BUF in buffer RESULTS-BUF.
If APPEND-P is non-nil and RESULTS-BUF is not empty, then insert a
separator line between previous search results and the current results.</span>"
  (set-buffer results-buf)
  (setq buffer-read-only  nil)
  (unless (= (point-min) (point-max))
    (if (not appendp)
        (erase-buffer)
      (goto-char (point-max))
      (let ((beg  (point)))
        (insert "<span class="quote">\n</span>" (make-string (1- (window-width)) ?_) "<span class="quote">\n\n\n</span>")
        (add-text-properties beg (point) '(face synonyms-heading)))))
  (let ((start-result  (point)))
    (insert-buffer temp-buf)
    (select-window (display-buffer results-buf))
    (goto-char start-result)
    (forward-line 2)                    <span class="linecomment">; Put cursor on first synonym.</span>
    (when (looking-at "<span class="quote">^[0-9]. </span>") (goto-char (match-end 0)))
    (recenter 2)
    (synonyms-mode)
    (setq buffer-read-only  t)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-history-backward (arg)
  "<span class="quote">Run `synonyms' on a previous argument, moving backward in the history.
A prefix argument has the same meaning as for command `synonyms'.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (cdr synonyms-history) (error "<span class="quote">Cannot move backward in history</span>"))
  (push (pop synonyms-history) synonyms-history-forward) <span class="linecomment">; Put current on forward list.</span>
  (let* ((num-arg  (prefix-numeric-value arg))
         (morep    (eq synonyms-match-more-flag (atom arg)))
         (appendp  (eq synonyms-append-result-flag (and (wholenump num-arg) (/= 16 num-arg)))))
    
    <span class="linecomment">;; Visit last.  If *Synonyms* has appended search results, go to the previous one, from (point).</span>
    (if (not (get-buffer "<span class="quote">*Synonyms*</span>"))
        (synonyms-action (car synonyms-history))
      (let ((divider  (with-current-buffer "<span class="quote">*Synonyms*</span>" (re-search-backward "<span class="quote">^___</span>" nil t))))
        (if (not divider)
            (synonyms-action (car synonyms-history))
          (set-buffer "<span class="quote">*Synonyms*</span>")
          (goto-char divider)
          (unless (re-search-backward "<span class="quote">^Synonyms for \\([^:]+\\):</span>" nil t)
            (error "<span class="quote">Cannot find previous synonyms page</span>"))
          (goto-char (match-beginning 1))
          (recenter 0)
          (message "<span class="quote">%s</span>" (buffer-substring (match-beginning 1) (match-end 1))))))))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-history-forward (arg)
  "<span class="quote">Run `synonyms' on a previous argument, moving forward in the history.
A prefix argument has the same meaning as for command `synonyms'.</span>"
  (interactive "<span class="quote">P</span>")
  (unless synonyms-history-forward (error "<span class="quote">Cannot move forward in history</span>"))
  (push (pop synonyms-history-forward) synonyms-history) <span class="linecomment">; Put current on backward list.</span>
  (let* ((num-arg  (prefix-numeric-value arg))
         (morep    (eq synonyms-match-more-flag (atom arg)))
         (appendp  (eq synonyms-append-result-flag (and (wholenump num-arg) (/= 16 num-arg)))))

    <span class="linecomment">;; Visit current.  If *Synonyms* has appended search results, go to the next one, from (point).</span>
    (if (not (get-buffer "<span class="quote">*Synonyms*</span>"))
        (synonyms-action (car synonyms-history))
      (let ((divider  (with-current-buffer "<span class="quote">*Synonyms*</span>" (re-search-forward "<span class="quote">^___</span>" nil t))))
        (if (not divider)
            (synonyms-action (car synonyms-history))
          (set-buffer "<span class="quote">*Synonyms*</span>")
          (goto-char divider)
          (unless (re-search-forward "<span class="quote">^Synonyms for \\([^:]+\\):</span>" nil t)
            (error "<span class="quote">Cannot find next synonyms page</span>"))
          (goto-char (match-beginning 1))
          (recenter 0)
          (message "<span class="quote">%s</span>" (buffer-substring (match-beginning 1) (match-end 1))))))))

<span class="linecomment">;;;###autoload</span>
(defalias 'dictionary-definition 'synonyms-definition)
<span class="linecomment">;;;###autoload</span>
(defun synonyms-definition (search-text alternate-p)
  "<span class="quote">Look up the definition of a word or phrase using online dictionaries.
The dictionary used is `synonyms-dictionary-url'.
With prefix arg, look up the definition in the alternate dictionary,
`synonyms-dictionary-alternate-url'.</span>"
  (interactive (list (completing-read "<span class="quote">Look up definition of word or phrase (regexp): </span>"
                                      synonyms-obarray nil nil nil 'synonyms-history
                                      (synonyms-default-regexp))
                     current-prefix-arg))
  (synonyms-ensure-synonyms-read-from-cache) <span class="linecomment">; Fill `synonyms-obarray', for use in completion.</span>
  (browse-url (concat  (if alternate-p synonyms-dictionary-alternate-url synonyms-dictionary-url)
                       search-text)))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-definition-no-read (alternate-p)
  "<span class="quote">Look up the definition of a word or phrase using online dictionaries.
The dictionary used is `synonyms-dictionary-url'.
With prefix arg, look up the definition in the alternate dictionary,
`synonyms-dictionary-alternate-url'.</span>"
  (interactive "<span class="quote">P</span>")
  (synonyms-definition (synonyms-default-regexp) alternate-p))

<span class="linecomment">;;;###autoload</span>
(defun synonyms-definition-mouse (event alternate-p)
  "<span class="quote">Look up the definition of a word or phrase using online dictionaries.
The dictionary used is `synonyms-dictionary-url'.
With prefix arg, look up the definition in the alternate dictionary,
`synonyms-dictionary-alternate-url'.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (set-buffer (window-buffer (posn-window (event-end event))))
  (let ((beg     (region-beginning))
        (end     (region-end))
        (active  mark-active))
    (goto-char (posn-point (event-end event)))
    (cond ((get-text-property (point) 'back-link) (synonyms-history-backward nil))
          ((get-text-property (point) 'forward-link) (synonyms-history-forward nil))
          (t (if (and active (&gt; (point) beg) (&lt; (point) end))
                 (goto-char end)
               (deactivate-mark))       <span class="linecomment">; User did not click inside region, so deactivate it.</span>
             (synonyms-definition (synonyms-default-regexp) alternate-p)))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'synonyms)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; synonyms.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=synonyms.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=synonyms.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=synonyms.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=synonyms.el">Administration</a></span><span class="time"><br /> Last edited 2012-03-02 16:54 UTC by <a class="author" title="from inet-rmmc14-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=synonyms.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
