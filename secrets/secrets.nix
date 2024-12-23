 let keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPNPRzSLlLpDQwA9QpurZnREyON6z9wHiNJ9tZexFmgh alex@Alexs-MacBook-Pro.local" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbR6nZNH5j1AKVURwjyF2Pyhu/aAgttiu8eIOhiG2mn alex@vmi2319146"]; in
 {
   "secrets.age".publicKeys = keys;
   "coolify.age".publicKeys = keys;
 }
