"use strict";

function activeTab() {
    return new Promise(function (resolve, reject) {
        chrome.tabs.query(
            { currentWindow: true, active: true },
            function (tabs) {
                if (tabs != null && 0 < tabs.length) {
                    resolve(tabs[0].id);
                } else {
                    reject();
                }
            }
        );
    });
}

function openTabWindow() {
    // open new tab window, passing ID of open tab with content to convert to epub as query parameter.
    return new Promise((resolve, reject) => {
        activeTab().then(function (tabId) {
            let url = chrome.runtime.getURL("popup.html") + `?id=${tabId}`;
            chrome.tabs.create({ url: url });
            resolve();
        });
    });
}

async function activeUrl() {
    return new Promise(function (resolve, reject) {
        chrome.tabs.query(
            { currentWindow: true, active: true },
            function (tabs) {
                if (tabs != null && 0 < tabs.length) {
                    resolve(tabs[0].url ?? tabs[0].pendingUrl);
                } else {
                    reject();
                }
            }
        );
    });
}

async function tabUrl(tabId) {
    const tab = await chrome.tabs.get(tabId);
    return tab.url ?? tab.pendingUrl;
}
