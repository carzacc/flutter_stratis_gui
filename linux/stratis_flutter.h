#ifndef STRATIS_FLUTTER_H
#define STRATIS_FLUTTER_H

#include <flutter_plugin_registrar.h>

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

#if defined(__cplusplus)
extern "C" {
#endif

FLUTTER_PLUGIN_EXPORT void StratisFlutterRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif // STRATIS_FLUTTER_H