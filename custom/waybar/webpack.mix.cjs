let mix = require('laravel-mix')
let path = require('path')

// mix.alias({
//   '@waybar': path.join(__dirname)
// })

// console.log(__dirname)
// console.log(path.join(__dirname, '../../.config/waybar/'))
// mix.alias({
//   '@waybar': path.join(__dirname, '../../.config/waybar/')
// })

// mix.postCss('main.css', '/style.css')

mix.postCss('main.css', path.join(__dirname, '../../.config/waybar/style.css'))
