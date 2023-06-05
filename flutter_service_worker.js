'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "4a743552194ab227fa136067be8e003a",
"/": "4a743552194ab227fa136067be8e003a",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"version.json": "213b4acadf805ab111bd6018fb9749c5",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "d91386ab80c79f51e1ac076f2dc435bd",
"assets/NOTICES": "ca24272735e2aba79fc950d893750a74",
"assets/AssetManifest.smcbin": "193eeae082a941b89851abd6250d821a",
"assets/FontManifest.json": "cdf1612100f44df1b24c7962a56db78d",
"assets/AssetManifest.json": "9f452badbf7d3560e2258624559aa57f",
"assets/lib/asset/icons/iconfont.ttf": "1450531440bc6846365900b06189c333",
"assets/lib/asset/sounds/zuowandao.flac": "56b2bbf70dc14d2eb6d8af920d659579",
"assets/lib/asset/sounds/wellerman.flac": "f37243cc9fa084719747041b390b6464",
"assets/lib/asset/sounds/toxic.flac": "f77470cbd78f447f3865ec5f1e2f03b3",
"assets/lib/asset/fonts/MaShanZheng-Regular.ttf": "dca1fc11a8c2b012170b0de12c13d788",
"assets/lib/asset/fonts/ZhiMangXing-Regular.ttf": "77173d0c0e687f4c52c44bc45ad8c3e5",
"assets/lib/asset/fonts/LiuJianMaoCao-Regular.ttf": "8ffbca95632fcdb566610a4c6fd04d4d",
"assets/lib/asset/images/logo.png": "58350fc0463be89a8548bcd7cc6ed1c7",
"assets/lib/asset/images/toxic.jpg": "3d1e966b627ef5087d52e71d8a17cd40",
"assets/lib/asset/images/qqchat.jpg": "22bdb32abdfa49f97b4010b1338597f8",
"assets/lib/asset/images/avatar.png": "68998a382ec072f00319ff1db82b2148",
"assets/lib/asset/images/easyclash.png": "3f14158219f1867764b1ec4c6928ab1d",
"assets/lib/asset/images/zuowandao.jpg": "91c6f0818753f26b7568800bbca4ca21",
"assets/lib/asset/images/v2ray.png": "8190de81f6eee251dd8ebc7e82f9ae62",
"assets/lib/asset/images/wellerman.jpg": "cc24715a41cc65a9c471499066d29fad",
"assets/lib/asset/images/localtion.png": "34d766799d2539d7c1f80f3dfb880d7c",
"assets/lib/asset/images/weichat.jpg": "e732d3c6fe8fe24de009b38248da11a9",
"assets/lib/asset/images/dawn.png": "e72f5b4667a90aa0647b79bcd3d80f61",
"assets/lib/datas/sci.json": "1266f73900f7810b2b02a343aaeacd7a",
"assets/lib/datas/java.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/datas/person.json": "6f62eb85b1d11a639fb9f88605b29834",
"assets/lib/datas/flu.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/datas/go.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"main.dart.js": "2310e81b55b1804a271c85f085f8c212",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "d295eac258ed34c1328fe43a58e296a1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
