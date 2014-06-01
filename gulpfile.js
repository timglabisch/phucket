var gulp = require('gulp');
var fs = require('fs');

gulp.task('default', function() {

    gulp.watch(['web/**', 'app/**'], function(e) {

        console.log("trigger");

        result = execSync.exec("unison -auto -prefer newer -silent -ui text -fastcheck true /Users/tim/proj_/phucket ssh://vagrant@192.168.55.44//var/www")

        console.log("/ trigger");

        if(result.code != 0)
            console.log("ERR:  " + result.stdout)

    })


});

