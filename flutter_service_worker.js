'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"index.html": "4e150fb1ff9ba8ca4c87d7bd82062f97",
"/": "4e150fb1ff9ba8ca4c87d7bd82062f97",
"main.dart.js": "9436bd8678d8f0cc8418d595d7afabf6",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "d295eac258ed34c1328fe43a58e296a1",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "213b4acadf805ab111bd6018fb9749c5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/lib/asset/sounds/toxic.flac": "f77470cbd78f447f3865ec5f1e2f03b3",
"assets/lib/asset/sounds/wellerman.flac": "f37243cc9fa084719747041b390b6464",
"assets/lib/asset/sounds/zuowandao.flac": "56b2bbf70dc14d2eb6d8af920d659579",
"assets/lib/asset/icons/iconfont.ttf": "cdca0f502783517e4bdff550c48b532b",
"assets/lib/asset/fonts/LiuJianMaoCao-Regular.ttf": "8ffbca95632fcdb566610a4c6fd04d4d",
"assets/lib/asset/fonts/MaShanZheng-Regular.ttf": "dca1fc11a8c2b012170b0de12c13d788",
"assets/lib/asset/fonts/ZhiMangXing-Regular.ttf": "77173d0c0e687f4c52c44bc45ad8c3e5",
"assets/lib/asset/images/localtion.png": "34d766799d2539d7c1f80f3dfb880d7c",
"assets/lib/asset/images/qqchat.jpg": "22bdb32abdfa49f97b4010b1338597f8",
"assets/lib/asset/images/easyclash.png": "3f14158219f1867764b1ec4c6928ab1d",
"assets/lib/asset/images/toxic.jpg": "3d1e966b627ef5087d52e71d8a17cd40",
"assets/lib/asset/images/v2ray.png": "8190de81f6eee251dd8ebc7e82f9ae62",
"assets/lib/asset/images/zuowandao.jpg": "91c6f0818753f26b7568800bbca4ca21",
"assets/lib/asset/images/avatar.png": "68998a382ec072f00319ff1db82b2148",
"assets/lib/asset/images/weichat.jpg": "e732d3c6fe8fe24de009b38248da11a9",
"assets/lib/asset/images/logo.png": "58350fc0463be89a8548bcd7cc6ed1c7",
"assets/lib/asset/images/dawn.png": "e72f5b4667a90aa0647b79bcd3d80f61",
"assets/lib/asset/images/wellerman.jpg": "cc24715a41cc65a9c471499066d29fad",
"assets/lib/datas/go.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/datas/sci.json": "1266f73900f7810b2b02a343aaeacd7a",
"assets/lib/datas/java.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/datas/person.json": "6f62eb85b1d11a639fb9f88605b29834",
"assets/lib/datas/flu.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/FontManifest.json": "cdf1612100f44df1b24c7962a56db78d",
"assets/NOTICES": "7c71f655c636e249a278687538d4519f",
"assets/AssetManifest.json": "9f452badbf7d3560e2258624559aa57f"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
