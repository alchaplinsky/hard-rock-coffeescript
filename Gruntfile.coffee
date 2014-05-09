module.exports = (grunt) =>
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    less:
      development:
        options:
          compress: true
          yuicompress: true
          optimization: 2
        files:
          "_theme/assets/style.css": "_theme/stylesheets/main.less"
          "_theme/assets/print.css": "_theme/stylesheets/print.less"
    gitbook:
      development:
        input: "./"
        github: "alchapone/hard-rock-coffeescript"
        theme: "/usr/local/lib/node_modules/gitbook/theme"
    "gh-pages":
      options:
        base: '_book'
      src: ['**']
    clean:
      files: '.grunt'
    watch:
      pages:
        files: ["**/*.md"]
        tasks: ['gitbook']

  grunt.registerTask 'publish', ['gitbook', 'gh-pages','clean']
