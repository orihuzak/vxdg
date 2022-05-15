module xdg

import os

// config_path return $XDG_CONFIG_HOME/{app}/{file} path
pub fn config_path(app_name string, config_fname string) string {
	config_dir := os.config_dir() or { panic(err) }
	config_path := os.join_path(config_dir, app_name, config_fname)
	return config_path
}

// data_dir return $XDG_DATA_HOME directory path
pub fn data_dir() string {
	return os.getenv_opt('XDG_DATA_HOME') or { os.join_path(os.home_dir(), '.local', 'share') }
}

// data_path return $XDG_DATA_HOME/{app}/{file} path
pub fn data_path(app_name string, data_fname string) string {
	data_path := os.join_path(data_dir(), app_name, data_fname)
	return data_path
}
