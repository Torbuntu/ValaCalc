valacalc_sources = [
  'main.vala',
  'window.vala',
]

valacalc_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('gobject-2.0'),
]

gnome = import('gnome')

valacalc_sources += gnome.compile_resources('valacalc-resources',
  'valacalc.gresource.xml',
  c_name: 'valacalc'
)

executable('valacalc', valacalc_sources,
  vala_args: '--target-glib=2.50',  dependencies: valacalc_deps,
  install: true,
)
