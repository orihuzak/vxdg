module xdg

import os

const (
	app_name     = 'sample'
	config_fname = 'config.json'
	data_fname   = 'data.json'
)

fn test_config_path() {
	cfg_path := config_path(app_name, config_fname)
	assert cfg_path == os.home_dir() + '/.config/sample/config.json'
}

fn test_data_dir() {
	ddir := data_dir()
	assert os.exists(ddir)
}

fn test_data_path() {
	dpath := data_path(app_name, data_fname)
	assert dpath == os.home_dir() + '/.local/share/sample/data.json'
}
