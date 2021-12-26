/*
    This script is injected into the active tab
    It sends the url
*/
"use strict";

chrome.runtime.sendMessage({
    messageType: "content-url",
    url: document.URL,
});
