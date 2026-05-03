-- if error finding headers then see https://stackoverflow.com/questions/74785927/clangd-doesnt-recognize-standard-headers/74794355#74794355
return {
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
}
