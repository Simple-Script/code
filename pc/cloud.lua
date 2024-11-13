local gtk = require("gtk")

local function openApp1()
    os.execute("path/to/your/app1")
end

local function openApp2()
    os.execute("path/to/your/app2")
end

local window = gtk.window_new(gtk.WINDOW_TOPLEVEL)
window:set_title("App Launcher")
window:set_default_size(300, 200)

local vbox = gtk.vbox_new(false, 5)

local button1 = gtk.button_new_with_label("Open App 1")
button1:connect("clicked", openApp1)

local button2 = gtk.button_new_with_label("Open App 2")
button2:connect("clicked", openApp2)

vbox:pack_start(button1, true, true, 0)
vbox:pack_start(button2, true, true, 0)

window:add(vbox)

window:connect("destroy", gtk.main_quit)
window:show_all()

gtk.main()
