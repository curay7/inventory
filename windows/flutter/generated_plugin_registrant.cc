//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <app_links_windows/app_links_windows_plugin.h>
#include <sidebar_bigeagle/side_bar.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  AppLinksWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AppLinksWindowsPlugin"));
  SideBarRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SideBar"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
