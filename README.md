To remove `.tmp` files (Windows Godot bug):

```bash
Get-ChildItem -Recurse -Filter *.tmp | Remove-Item -Force
```
