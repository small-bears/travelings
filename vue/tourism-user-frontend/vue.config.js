module.exports = {
	transpileDependencies: true,
	publicPath:'/',
	outputDir: 'dist', // 输出文件目录：在npm run build时，生成文件的目录名称
  	assetsDir: 'assets', // 放置生成的静态资源 (js、css、img、fonts) 的 (相对于 outputDir 的) 目录
	devServer: {
		host: '127.0.0.1',
		port: 3001, // 端口
		open: true,
	},
	/* 修改html标题 */
	chainWebpack: config => {
		config.plugin('html')
			.tap(args => {
				args[0].title = "旅游信息推荐系统";
				return args;
			})
	},
}
