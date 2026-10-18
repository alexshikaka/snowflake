"""Пишет version_info.txt для PyInstaller из файла VERSION (название, версия, автор в свойствах .exe)."""
import os, sys
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ver = open(os.path.join(root, "VERSION"), encoding="utf-8").read().strip()
nums = (ver.split(".") + ["0"] * 4)[:4]
t = tuple(int(n) for n in nums)
text = f"""VSVersionInfo(
  ffi=FixedFileInfo(filevers={t}, prodvers={t}, mask=0x3f, flags=0x0, OS=0x40004, fileType=0x1, subtype=0x0, date=(0, 0)),
  kids=[
    StringFileInfo([StringTable('041904B0', [
      StringStruct('CompanyName', 'shikaka068091'),
      StringStruct('FileDescription', 'Котик на рабочем столе'),
      StringStruct('FileVersion', '{ver}'),
      StringStruct('InternalName', 'CatPet'),
      StringStruct('LegalCopyright', 'shikaka068091'),
      StringStruct('OriginalFilename', 'CatPet.exe'),
      StringStruct('ProductName', 'Котик на рабочем столе'),
      StringStruct('ProductVersion', '{ver}')])]),
    VarFileInfo([VarStruct('Translation', [0x0419, 1200])])
  ]
)
"""
open(os.path.join(root, "installer", "version_info.txt"), "w", encoding="utf-8").write(text)
print(ver)
