module vxdg

import os

// config_path return string: $XDG_CONFIG_HOME/[app_name]/[file] or $HOME/.config/[app_name]/[file]
pub fn config_path(app_name string, fname string) string {
	config_dir := os.config_dir() or { panic(err) }
	config_path := os.join_path(config_dir, app_name, fname)
	return config_path
}

// data_dir return string: $XDG_DATA_HOME or $HOME/.local/share directory
pub fn data_dir() string {
	return os.getenv_opt('XDG_DATA_HOME') or { os.join_path(os.home_dir(), '.local', 'share') }
}

// data_path return string: $XDG_DATA_HOME/{app_name}/{file} or $HOME/.local/share/[app_name]/[file]
pub fn data_path(app_name string, fname string) string {
	data_path := os.join_path(data_dir(), app_name, fname)
	return data_path
}
