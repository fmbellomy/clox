project('clox', 'c',
  version : '0.0.1',
  default_options : ['warning_level=3'])
incdir = include_directories('include')
subdir('src')
executable('clox',
           sources,
           include_directories : incdir,
           install : true)
