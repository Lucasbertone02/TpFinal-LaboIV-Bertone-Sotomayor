'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "e745b42f8ac81cf7bc950761a572891c",
"assets/AssetManifest.bin.json": "9a868f81e0068f138189672d74090bd3",
"assets/AssetManifest.json": "e52b98eb843f7cc91a6bafba88663000",
"assets/assets/avatars/avatar6.png": "a9a277de0b37380c61783d797b367c8d",
"assets/assets/fonts/Rubik-VariableFont_wght.ttf": "6d3102fa33194bef395536d580f91b56",
"assets/assets/images/banner.jpg": "0e52b7987d84848b2192030f1c7a25bc",
"assets/assets/images/cielo.jpg": "00364d9180b8de0f9bb26e16a9fbb414",
"assets/assets/images/cont_alta.png": "144ca018c9d45eb71113d7273e1449f4",
"assets/assets/images/cont_avanzada.png": "2592cbd41d2c50abb67b73dca0865d79",
"assets/assets/images/cont_baja.png": "ced235cb1a1da1cd13e66d1102a11372",
"assets/assets/images/cont_justa.png": "4225226726062bab5f2e3e2325489723",
"assets/assets/images/cont_moderado.png": "41fe94df47946f00060565da3bf40744",
"assets/assets/images/drawer_baner.jpg": "77179938e77a01a242ef84dddd35988c",
"assets/assets/images/list_item.png": "0dd876c1ae45fe1f2472917e6fb20564",
"assets/assets/images/lluvia.png": "c0007ae86b8c39d0ed9e940b9b0682c2",
"assets/assets/images/no_encontrado.png": "8952c2182c7cc6c03eb3ef0648b2d044",
"assets/assets/images/nublado.png": "4dd00316f98a1b373b2cfe4329a0544c",
"assets/assets/images/Pasos.png": "965c73780cef14b6092e2fc418861f05",
"assets/assets/images/sol.png": "e5c2fea6d34c15e7f9d5e034f9090bae",
"assets/assets/images/sol_nubes.png": "65a157a9538964ebb6776cb75ca0d520",
"assets/assets/images/tormenta.png": "0e77b48d87fee628690dbbc92404037f",
"assets/assets/lottie/animacionCalentamientoGlobal.json": "a20e54010db262cc6cb1d499a5489843",
"assets/assets/lottie/animacionClima.json": "8cd5326132581bc19b6a608f485b3aa4",
"assets/assets/lottie/animacionClimaDia.json": "79c71711cbdc799c3cf2478288fec666",
"assets/assets/lottie/animacionContaminacion.json": "fac59822a997f6c5747a2f1895b3630d",
"assets/assets/lottie/animacionFabrica.json": "a6933b191031a2757e728a821d0d30cb",
"assets/assets/lottie/animacionFlecha.json": "acf1ec581999befcf65c9a11e1410d56",
"assets/assets/lottie/animacionPlaneta.json": "b0ae0c30bbbfa7750630dc0f1b3fd20f",
"assets/assets/lottie/animacionReflexion.json": "8b45de50443e2dacd1d2fece6b9779b2",
"assets/FontManifest.json": "10029bd2eae8e057ceb7a6ccdd810246",
"assets/fonts/MaterialIcons-Regular.otf": "b22040148af86ea7f7e6b51eeedbe803",
"assets/NOTICES": "5ca15d02f2b01d98bd25f78a78abc98f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/weather_icons/lib/fonts/weathericons-regular-webfont.ttf": "b488ac89ad51a3869cb44f6c47f648a4",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "8cc4454fe7a07261a9ba4b640f1491dc",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e7079daf195d4be116ccfee2c84ad17a",
"/": "e7079daf195d4be116ccfee2c84ad17a",
"main.dart.js": "559a95ae6fb62cba0a015989974a7daa",
"manifest.json": "3d5925565affa2772e35c79e025e49c4",
"version.json": "14d7e243f3a034962c316491611f8b09"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
