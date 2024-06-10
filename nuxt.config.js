import jogos from "./database/jogos.js";

export default {
  // Target: https://go.nuxtjs.dev/config-target
  target: "static",
  
  buildModules: ['@nuxtjs/google-fonts'],

  ssr: true,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: "MedArcade - Centro Universitário Integrado",
    htmlAttrs: {
      lang: "pt-br",
    },
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      {
        hid: "description",
        name: "description",
        content:
          "Jogos e simuladores do curso de Medicina do Centro Universitário Integrado",
      },
      { name: "format-detection", content: "telephone=no" },
      {
        hid: "apple-mobile-web-app-capable",
        name: "apple-mobile-web-app-capable",
        content: "yes",
      },
      {
        hid: "apple-mobile-web-app-status-bar-style",
        name: "apple-mobile-web-app-status-bar-style",
        content: "black",
      },
    ],
    script: [
      {
        src: 'https://code.jquery.com/jquery-3.6.3.min.js',
        integrity: 'sha256-Uv9jxBenhLL1+qzfUyxk5wrP+L5qvhwLTP60qjzTpL8=',
        crossorigin: 'anonymous'
      },
      {
        src: 'https://code.jquery.com/jquery-migrate-3.4.1.min.js',
        integrity: 'sha256-KsRjqSIvQznv43EKdppYBn6tNtGKSQp7D4qU2P8N/uY=',
        crossorigin: 'anonymous'
      },
      {
        src: 'https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js',
        integrity: 'sha384-wHNqQXa6a5X6i67C4GvKNiiOUa7M7VYkPStStjqO5jWrGGIC8dQjNIlWZq8Aysu+',
        crossorigin: 'anonymous'
      },
      {
        src: 'https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js',
        integrity: 'sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jY3zHTnfnHGOMHu1vUPEN8C9zFveqN+',
        crossorigin: 'anonymous'
      },
      {
        src: 'https://cdnjs.cloudflare.com/ajax/libs/easing/3.0.0/easing.min.js'
      },
      {
        src: 'https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js',
        integrity: 'sha512-SJ2Kfkzp69PgNOUuhWh8lvzjohnnoPCNKnrOEoMaPtCL8z4HTtW/xPtOQSZKpFN0UFbU/DG2bm3s2zM8FFIlcA==',
        crossorigin: 'anonymous'
      },
      {
        src: 'https://cdnjs.cloudflare.com/ajax/libs/CounterUp/2.3.0/jquery.counterup.min.js',
        integrity: 'sha512-eZYtkXONaC9By3XGZ/PN4PNac4rN3tK8upQ9U9jR73HGjXup0YXF+r+r0CFhi2Dn24y8U8B8ZXaGQCv73yA==',
        crossorigin: 'anonymous'
      },
      {
        src: 'https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js',
        integrity: 'sha512-hzTunOHHWha0HxhiiSXL4UWCBRa/TCZCrsc5xwKJqFsLf/GJ2zBV/ONuDX9WcusnYbE7AWem/qEtqDM7DjvwTlw==',
        crossorigin: 'anonymous'
      },
      {
        src: '/medarcade/pages/info/main.js'
      },
      {
        type: 'text/javascript',
        innerHTML: `
          if(window.history.replaceState){
            window.history.replaceState(null, null, window.location.href);
          }
        `
      }
    ],
    link: [
      { rel: "icon", type: "image/x-icon", href: "/logo_centro universitario integrado-02.png" },
      {
        rel: "apple-touch-icon",
        href: "/favicon.png",
      },
      {
        href: "splashscreens/iphone5_splash.png",
        media:
          "(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/iphone6_splash.png",
        media:
          "(device-width: 375px) and (device-height: 667px) and (-webkit-device-pixel-ratio: 2)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/iphoneplus_splash.png",
        media:
          "(device-width: 621px) and (device-height: 1104px) and (-webkit-device-pixel-ratio: 3)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/iphonex_splash.png",
        media:
          "(device-width: 375px) and (device-height: 812px) and (-webkit-device-pixel-ratio: 3)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/iphonexr_splash.png",
        media:
          "(device-width: 414px) and (device-height: 896px) and (-webkit-device-pixel-ratio: 2)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/iphonexsmax_splash.png",
        media:
          "(device-width: 414px) and (device-height: 896px) and (-webkit-device-pixel-ratio: 3)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/ipad_splash.png",
        media:
          "(device-width: 768px) and (device-height: 1024px) and (-webkit-device-pixel-ratio: 2)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/ipadpro1_splash.png",
        media:
          "(device-width: 834px) and (device-height: 1112px) and (-webkit-device-pixel-ratio: 2)",
        rel: "apple-touch-startup-image",
      },
      {
        href: "splashscreens/ipadpro3_splash.png",
        media:
          "(device-width: 834px) and (device-height: 1194px) and (-webkit-device-pixel-ratio: 2)",
        rel: "apple-touch-startup-image",
      },
    ],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    'bootstrap/dist/css/bootstrap.css'
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    { src: '~/plugins/jquery.js', mode: 'client' }, // Carrega o plugin jQuery apenas no lado do cliente
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: ["@nuxtjs/onesignal", "@nuxtjs/pwa", "@nuxtjs/gtm"],

  gtm: {
    id: "GTM-N79RZHG",
    enabled: true,
    pageTracking: true,
    crossOrigin: true,
    noscriptId: "GTM-N79RZHG",
  },

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/bootstrap
    "bootstrap-vue/nuxt",
  ],

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {},

  generate: {
    routes() {
      return jogos.map((j) => j.url);
    },
    
  },
  

  pwa: {
    icon: {
      fileName: "logo.png",
      sizes: [64, 120, 144, 152, 192, 384, 512],
    },
    manifest: {
      name: "MedArcade",
      short_name: "MedArcade",
      lang: "pt-br",
      crossorigin: "use-credentials",
      theme_color: "#0D2543",
      background_color: "#0D2543",
    },
    meta: {
      mobileAppIOS: false,
    },
  },
  oneSignal: {
    init: {
      appId: "4f8891a9-46f7-412e-bbd3-a58aad95ff80",
      allowLocalhostAsSecureOrigin: true,
      welcomeNotification: {
        disable: true,
      },
    },
  },
};
