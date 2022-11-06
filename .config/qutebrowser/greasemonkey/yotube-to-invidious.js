// ==UserScript==
// @name           youtube to Nitter redirector
// @namespace      mamg22's userscripts
// @match          http://youtube.com/*
// @match          https://youtube.com/*
// @match          http://www.youtube.com/*
// @match          https://www.youtube.com/*
// @exclude        https://youtube.com/
// @run-at         document-start
// ==/UserScript==

location.href=location.href.replace("www.youtube.com","invidious.weblibre.org");
