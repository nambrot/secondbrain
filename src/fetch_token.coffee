chrome.storage.sync.set {
    token: document.getElementById('token').innerHTML
    email: document.getElementById('email').innerHTML
  }, ->
    console.log 'got it'