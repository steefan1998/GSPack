// Re-centre Welcome once on entry, including when FTB restores an old scroll position.
const GSPACK_FOCUS_MC = Java.loadClass('net.minecraft.client.Minecraft')
const GSPACK_FOCUS_WRAPPER = Java.loadClass('dev.ftb.mods.ftblibrary.client.gui.IScreenWrapper')
const GSPACK_FOCUS_SCREEN = Java.loadClass('dev.ftb.mods.ftbquests.client.gui.quests.QuestScreen')
let gspackPreviousQuestGui = null
let gspackPreviousChapterId = ''
ClientEvents.tick(event => {
  let screen = GSPACK_FOCUS_MC.getInstance().screen
  if (!(screen instanceof GSPACK_FOCUS_WRAPPER)) { gspackPreviousQuestGui = null; gspackPreviousChapterId = ''; return }
  let gui = screen.getGui()
  if (!(gui instanceof GSPACK_FOCUS_SCREEN)) { gspackPreviousQuestGui = null; gspackPreviousChapterId = ''; return }
  let selected = gui.getSelectedChapter()
  if (!selected.isPresent()) return
  let chapter = selected.get()
  let id = String(chapter.getCodeString()).toUpperCase()
  if (gui === gspackPreviousQuestGui && id === gspackPreviousChapterId) return
  gspackPreviousQuestGui = gui
  gspackPreviousChapterId = id
  if (id !== '222972F518CA85E0') return
  let focus = chapter.getAutofocus()
  if (focus.isPresent()) {
    gui.addZoom((12 - gui.getZoom()) / 4)
    gui.scrollTo(focus.get())
  }
})
