
int main (string[] args) {
	var app = new Gtk.Application ("org.gnome.Valacalc", ApplicationFlags.FLAGS_NONE);
	app.activate.connect (() => {
		var win = app.active_window;
		if (win == null) {
			win = new Valacalc.Window (app);
		}
		win.present ();
	});

	return app.run (args);
}
