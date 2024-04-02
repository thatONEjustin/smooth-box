let mix = require('laravel-mix')
let path = require('path')

let public_path = path.resolve(__dirname, '../../')

mix.options({ manifest: false })
mix.setPublicPath(public_path)
  .postCss('main.css', '.config/waybar/style.css')
