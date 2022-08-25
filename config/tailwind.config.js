module.exports = {
  purge: {
    enabled: true,
    preserveHtmlElements: false,
    content: [
      '../app/helpers/**/*.rb',
      '../app/javascript/**/*.js',
      '../app/javascript/**/**/*.vue',
      '../app/javascript/**/*.vue',
      '../app/views/**/*.html.erb'
    ],
    darkMode: false
  },
  content: [
    '../app/helpers/**/*.rb',
    '../app/javascript/**/*.js',
    '../app/javascript/**/*.vue',
    '../app/views/**/*.html.erb'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography')
  ]
}
