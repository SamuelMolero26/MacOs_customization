#import <Cocoa/Cocoa.h>
#include "../sketchybar.h"

static char g_event_name[256];

static void trigger_focus(void) {
  FILE* fp = popen("yabai -m query --windows --window 2>/dev/null", "r");
  if (!fp) return;

  char result[4096];
  size_t len = fread(result, 1, sizeof(result) - 1, fp);
  pclose(fp);
  if (len == 0) return;
  result[len] = '\0';

  char* pos = strstr(result, "\"space\":");
  if (!pos) return;

  int space_id = 0;
  sscanf(pos, "\"space\":%d", &space_id);
  if (space_id == 0) return;

  char message[512];
  snprintf(message, sizeof(message),
           "--trigger '%s' space_id='%d'", g_event_name, space_id);
  sketchybar(message);
}

int main(int argc, char** argv) {
  if (argc < 2) {
    printf("Usage: %s \"<event-name>\"\n", argv[0]);
    return 1;
  }

  snprintf(g_event_name, sizeof(g_event_name), "%s", argv[1]);

  char setup[512];
  snprintf(setup, sizeof(setup), "--add event '%s'", g_event_name);
  sketchybar(setup);

  [NSWorkspace.sharedWorkspace.notificationCenter
    addObserverForName:NSWorkspaceDidActivateApplicationNotification
    object:nil
    queue:nil
    usingBlock:^(NSNotification* n) { trigger_focus(); }];

  [[NSRunLoop mainRunLoop] run];
  return 0;
}
